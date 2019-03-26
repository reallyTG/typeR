library(fscaret)


### Name: fscaret
### Title: feature selection caret
### Aliases: fscaret
### Keywords: methods iteration optimize array

### ** Examples


if((Sys.info()['sysname'])!="SunOS"){

library(fscaret)

# Load data sets
data(dataset.train)
data(dataset.test)

requiredPackages <- c("R.utils", "gsubfn", "ipred", "caret", "parallel", "MASS")

if(.Platform$OS.type=="windows"){

myFirstRES <- fscaret(dataset.train, dataset.test, installReqPckg=FALSE,
                  preprocessData=FALSE, with.labels=TRUE, classPred=FALSE,
                  regPred=TRUE, skel_outfile=NULL,
                  impCalcMet="RMSE&MSE", myTimeLimit=4,
                  Used.funcRegPred=c("lm"), Used.funcClassPred=NULL,
                  no.cores=1, method="boot", returnResamp="all",
                  supress.output=TRUE,saveModel=FALSE)

} else {

myCores <- 2

myFirstRES <- fscaret(dataset.train, dataset.test, installReqPckg=FALSE,
                  preprocessData=FALSE, with.labels=TRUE, classPred=FALSE,
                  regPred=TRUE, skel_outfile=NULL,
                  impCalcMet="RMSE&MSE", myTimeLimit=4,
                  Used.funcRegPred=c("lm","ppr"), Used.funcClassPred=NULL,
                  no.cores=myCores, method="boot", returnResamp="all",
                  supress.output=TRUE,saveModel=FALSE)

}



# Results
myFirstRES

}




