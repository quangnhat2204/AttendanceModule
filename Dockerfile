FROM python:3.6


COPY . .

RUN	apt-get update && \
	apt-get install -y python3-opencv && \
	apt-get -y upgrade

COPY	requirements_cpu.txt .

RUN	python -m pip install --upgrade pip && \
	pip install -r requirements_cpu.txt


ENV	PYTHONPATH=$PYTHONPATH:/__pycache__
ENV	PYTHONPATH=$PYTHONPATH:/lib
ENV	PYTHONPATH=$PYTHONPATH:/lib/__pycache__
ENV	PYTHONPATH=$PYTHONPATH:/lib/mtcnn

CMD	["python","server.py"]
