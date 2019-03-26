## ----setup, include=TRUE-------------------------------------------------

## ---- eval=FALSE---------------------------------------------------------
#  library(doParallel)
#  
#  detectCores()
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(doParallel)
#  
#  no_cores <- detectCores() - 2
#  cl <- makeCluster(no_cores)
#  registerDoParallel(cl)

## ---- eval=FALSE---------------------------------------------------------
#  library(doParallel)
#  
#  getDoParWorkers()

## ---- eval=FALSE---------------------------------------------------------
#  library(doParallel)
#  
#  stopImplicitCluster()
#  rm(cl)

