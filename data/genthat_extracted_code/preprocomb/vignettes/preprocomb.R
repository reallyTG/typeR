## ------------------------------------------------------------------------
set.seed(1)
testdata <- iris
testdata[sample(1:150,40),3] <- NA # add missing values to the third variable
testdata[,4] <- rnorm(150, testdata[,4], 2) # add noise to the fourth variable
testdata$Irrelevant <- runif(150, 0, 1) # add an irrelevant feature

## ---- include=FALSE, cache=FALSE-----------------------------------------
suppressMessages(library(ggplot2))
suppressMessages(library(lattice))
suppressMessages(library(kernlab))
suppressMessages(library(rpart))


## ---- messages=FALSE, warnings=FALSE-------------------------------------
library(preprocomb)
step1 <- prepro(testdata, "meanimpute", model="svmRadial")
step2 <- prepro(step1, "orhoutlier", model="svmRadial")
step2

## ---- messages=FALSE, warnings=FALSE, eval=FALSE-------------------------
#  examplegrid <- setgrid(phases=c("imputation", "outliers", "scaling", "smoothing", "selection"), data=testdata)
#  exampleresult <- preprocomb(grid=examplegrid, models=c("svmRadial"), nholdout=10, cluster=TRUE, outlier=TRUE, cores=2)

## ---- messages=FALSE, warnings=FALSE-------------------------------------
exampleresult@walltime

## ---- messages=FALSE, warnings=FALSE-------------------------------------
exampleresult@bestclassification

## ---- messages=FALSE, warnings=FALSE-------------------------------------
getpreprocessor()

## ---- messages=FALSE, warnings=FALSE-------------------------------------
getpreprocessor("basicscale")

## ---- messages=FALSE, warnings=FALSE-------------------------------------
scaleexample <- function(dataobject) {
dataobject <- initializedataclassobject(data.frame(x=scale(dataobject@x), y=dataobject@y))
}

## ---- messages=FALSE, warnings=FALSE-------------------------------------
setpreprocessor("scaleexample", "scaleexample(dataobject)")
step3 <- prepro(step2, "scaleexample", model="svmRadial") # continues the example above
step3

## ---- messages=FALSE, warnings=FALSE, eval=FALSE-------------------------
#  newscaling <- setphase("newscaling", c("noaction", "scaleexample"), TRUE)
#  newexamplegrid <- setgrid(phases=c("imputation", "newscaling"), data=testdata)

