# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9

# 
WORKDIR /app

# 
COPY ./requirements.txt /app/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

#
RUN python -m spacy download en_core_web_sm

# 
COPY ./app /app

#
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# 
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
