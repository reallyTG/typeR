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
#  # save as bos_rf_mls_deploy.R
#  
#  bos_rf <- readRDS("bos_rf.rds")
#  bos_rf_score <- function(inputData)
#  {
#      require(randomForest)
#      inputData <- as.data.frame(inputData)
#      predict(bos_rf, inputData)
#  }
#  
#  library(mrsdeploy)
#  
#  # make sure you use a strong password or Azure Active Directory authentication in production
#  remoteLogin("http://localhost:12800", username="admin", password="Microsoft@2018", session=FALSE)
#  api <- publishService("bos-rf", v="1.0.0",
#      code=bos_rf_score,
#      model=bos_rf,
#      inputs=list(inputData="data.frame"),
#      outputs=list(pred="vector"))
#  remoteLogout()

## ---- eval=FALSE---------------------------------------------------------
#  library(AzureContainers)
#  
#  az <- AzureRMR::az_rm$new(
#      tenant="72f988bf-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
#      app="f72c1733-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
#      password="xxxxxxxxx")
#  
#  deployresgrp <- az$
#      get_subscription("35975484-xxxx-xxxx-xxxx-xxxxxxxxxxxx")$
#      get_resource_group("deployresgrp")
#  
#  # get container registry
#  deployreg <- deployresgrp$get_acr("deployreg")$get_docker_registry()
#  
#  # build and upload image
#  call_docker("build -t bos-rf-mls .")
#  deployreg$push("bos-rf-mls")
#  
#  # get the Kubernetes cluster endpoint
#  deployclus <- deployresgrp$get_aks("deployclus")$get_cluster()
#  
#  # create and start the service
#  deployclus$create("bos-rf-mls.yaml")

## ---- eval=FALSE---------------------------------------------------------
#  # get status of the service, including the IP address
#  deployclus$get("service bos-rf-mls-svc")
#  #> Kubernetes operation: get service bos-rf-svc  --kubeconfig=".../kubeconfigxxxx"
#  #> NAME         TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)           AGE
#  #> bos-rf-svc   LoadBalancer   10.0.107.147   52.187.245.39   12800:30365/TCP   5m
#  
#  # obtain an authentication token from the server
#  response <- POST("http://52.187.245.39:12800/login/",
#      body=list(username="admin", password="Microsoft@2018"),
#      encode="json")
#  token <- content(response)$access_token
#  
#  # do the prediction, passing input values in the request body
#  bos_json <- jsonlite::toJSON(list(inputData=MASS::Boston[1:10,]),
#      dataframe="columns")
#  response <- POST("http://52.187.245.39:12800/api/bos-rf/1.0.0",
#      add_headers(Authorization=paste0("Bearer ", token),
#          `content-type`="application/json"),
#      body=bos_json)
#  content(response, simplifyVector=TRUE)$outputParameters$pred
#  #> [1] 25.9269 22.0636 34.1876 33.7737 34.8081 27.6394 21.8007 22.3577 16.7812 18.9785

## ---- eval=FALSE---------------------------------------------------------
#  bos_json_list <- jsonlite::toJSON(list(
#          list(inputData=MASS::Boston[1:10,]),
#          list(inputData=MASS::Boston[11:20,])),
#      dataframe="columns")
#  response <- POST("http://52.187.245.39:12800/api/bos-rf/1.0.0/batch?parallelCount=2",
#      add_headers(Authorization=paste0("Bearer ", token),
#          `content-type`="application/json"),
#      body=bos_json_list)
#  content(response)
#  #> $name
#  #> [1] "bos-rf"
#  #>
#  #> $version
#  #> [1] "1.0.0"
#  #>
#  #> $batchExecutionId
#  #> [1] "9c6be3d2-f4a0-477b-830d-b07a43403c6e"

## ---- eval=FALSE---------------------------------------------------------
#  response <- GET("http://52.187.245.39:12800/api/bos-rf/1.0.0/batch/9c6be3d2-f4a0-477b-830d-b07a43403c6e",
#      add_headers(Authorization=paste0("Bearer ", token),
#          `content-type`="application/json"))
#  content(response, simplifyVector=TRUE)$batchExecutionResults$outputParameters
#  #>                                                                                                 pred
#  #> 1 25.92692, 22.06357, 34.18765, 33.77370, 34.80810, 27.63945, 21.80073, 22.35773, 16.78120, 18.97845
#  #> 2 17.22610, 20.05682, 21.63635, 20.13023, 18.69370, 20.14845, 22.33917, 17.92152, 19.33282, 18.75947

