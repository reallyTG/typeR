## ---- eval=FALSE---------------------------------------------------------
#  data(Boston, package="MASS")
#  install.packages("randomForest")
#  library(randomForest)
#  
#  # train a model for median house price as a function of the other variables
#  bos_rf <- randomForest(medv ~ ., data=Boston, ntree=100)
#  
#  # save the model
#  saveRDS(bos.rf, "bos_rf.rds")

## ---- eval=FALSE---------------------------------------------------------
#  # save as bos_rf_score.R
#  
#  bos_rf <- readRDS("bos_rf.rds")
#  library(randomForest)
#  
#  #* @param df data frame of variables
#  #* @post /score
#  function(req, df)
#  {
#      df <- as.data.frame(df)
#      predict(bos_rf, df)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  library(AzureContainers)
#  
#  az <- AzureRMR::az_rm$new(
#      tenant="72f988bf-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
#      app="f72c1733-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
#      password="xxxxxxxxx")
#  
#  # create a resource group for our deployments
#  deployresgrp <- az$
#      get_subscription("35975484-xxxx-xxxx-xxxx-xxxxxxxxxxxx")$
#      create_resource_group("deployresgrp", location="australiaeast")
#  
#  # create container registry
#  deployreg_svc <- deployresgrp$create_acr("deployreg")
#  
#  # build image 'bos_rf'
#  call_docker("build -t bos_rf .")
#  
#  # upload the image to Azure
#  deployreg <- deployreg_svc$get_docker_registry()
#  deployreg$push("bos_rf")

## ---- eval=FALSE---------------------------------------------------------
#  # create an instance with 2 cores and 8GB memory, and deploy our image
#  deployaci <- deployresgrp$create_aci("deployaci",
#      image="deployreg.azurecr.io/bos_rf",
#      registry_creds=deployreg,
#      cores=2, memory=8,
#      ports=aci_ports(8000))

## ---- eval=FALSE---------------------------------------------------------
#  deployaci$sync_fields()
#  #> [1] "Succeeded"

## ---- eval=FALSE---------------------------------------------------------
#  response <- httr::POST("http://deployaci.australiaeast.azurecontainer.io:8000/score",
#      body=list(df=MASS::Boston[1:10,]), encode="json")
#  httr::content(response, flatten=TRUE)
#  #> [1] 25.9269 22.0636 34.1876 33.7737 34.8081 27.6394 21.8007 22.3577 16.7812 18.9785

## ---- eval=FALSE---------------------------------------------------------
#  # create a Kubernetes cluster with 2 nodes, running Linux (the default)
#  deployclus_svc <- deployresgrp$create_aks("deployclus", agent_pools=aks_pools("pool1", 2))

## ---- eval=FALSE---------------------------------------------------------
#  # get the cluster endpoint
#  deployclus <- deployclus_svc$get_cluster()
#  
#  # pass registry authentication details to the cluster
#  deployclus$create_registry_secret(deployreg, email="hongooi@microsoft.com")
#  
#  # create and start the service
#  deployclus$create("bos_rf.yaml")

## ---- eval=FALSE---------------------------------------------------------
#  deployclus$get("deployment bos-rf")
#  #> Kubernetes operation: get deployment bos-rf  --kubeconfig=".../kubeconfigxxxx"
#  #> NAME      DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
#  #> bos-rf    1         1         1            1           5m
#  
#  deployclus$get("service bos-rf-svc")
#  #> Kubernetes operation: get service bos-rf-svc  --kubeconfig=".../kubeconfigxxxx"
#  #> NAME         TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)          AGE
#  #> bos-rf-svc   LoadBalancer   10.0.8.189   52.187.249.58   8000:32276/TCP   5m

## ---- eval=FALSE---------------------------------------------------------
#  response <- httr::POST("http://52.187.249.58:8000/score",
#      body=list(df=MASS::Boston[1:10,]), encode="json")
#  httr::content(response, simplifyVector=TRUE)
#  #> [1] 25.9269 22.0636 34.1876 33.7737 34.8081 27.6394 21.8007 22.3577 16.7812 18.9785

## ---- eval=FALSE---------------------------------------------------------
#  deployclus$delete("service", "bos-rf-svc")
#  deployclus$delete("deployment", "bos-rf")

## ---- eval=FALSE---------------------------------------------------------
#  deployresgrp$delete()

