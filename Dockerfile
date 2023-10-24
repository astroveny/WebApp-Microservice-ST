# app/Dockerfile

FROM 235696014680.dkr.ecr.us-east-1.amazonaws.com/xtb-mo:3.10-slim-buster

WORKDIR /app


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt &&\
    apt-get update -y &&\
    apt-get install curl -y 

COPY . .

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "trading-xtb-st.py", "--server.port=8501", "--server.address=0.0.0.0"]