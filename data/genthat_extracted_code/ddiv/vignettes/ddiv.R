## ---- eval=FALSE---------------------------------------------------------
#  install.packages("ddiv_0.1.0.tar.gz", repos = NULL, type = "source")
#  library(ddiv)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  
#  ## Load the IV dataset with one step
#  data(IV_step1)
#  IV1 <- data.frame(IV_step1)
#  
#  ## Run IVExtractResult
#  IVExtractResult(IV1,plot.option=T)
#  
#  ## As this IV curve is known to have one step, IVfeature() can be used
#  IVfeature(IV1$I,IV1$V,crt=0.2,num=75,crtvalb=0.3)
#  
#  ## Load the IV dataset with two steps
#  data(IV_step2)
#  IV2 <- data.frame(IV_step2)
#  
#  ## Run IVExtractResult
#  IVExtractResult(IV2,plot.option=T)
#  
#  ## Load the IV dataset with three steps
#  data(IV_step3)
#  IV3 <- data.frame(IV_step3)
#  
#  ## Run IVExtractResult
#  IVExtractResult(IV3,plot.option=T)
#  

