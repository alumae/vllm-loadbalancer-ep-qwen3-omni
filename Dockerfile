FROM qwenllm/qwen3-omni:3-cu124

#RUN apt-get update -y \
#    && apt-get install -y python3-pip


# Install Python dependencies
COPY builder/requirements.txt /requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade -r /requirements.txt


ENV PYTHONPATH="/:/vllm-workspace"

COPY src /src

WORKDIR /src

CMD ["python3", "handler.py"]
