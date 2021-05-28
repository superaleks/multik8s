docker build -t lukicalk/multi-client:latest -t lukicalk/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lukicalk/multi-server:latest -t lukicalk/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lukicalk/multi-worker:latest -t lukicalk/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push lukicalk/multi-client:latest
docker push lukicalk/multi-server:latest
docker push lukicalk/multi-worker:latest

docker push lukicalk/multi-client:$SHA
docker push lukicalk/milti-server:$SHA
docker push lukicalk/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lukicalk/multi-server:$SHA
kubectl set image deployments/client-deployment client=lukicalk/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=lukicalk/multi-worker:$SHA






