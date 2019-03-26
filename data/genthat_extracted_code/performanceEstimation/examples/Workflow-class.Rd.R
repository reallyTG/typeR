library(performanceEstimation)


### Name: Workflow-class
### Title: Class "Workflow"
### Aliases: Workflow Workflow-class show,Workflow-method
###   summary,Workflow-method
### Keywords: classes

### ** Examples

showClass("Workflow")

## A simple standard workflow using a default svm
Workflow(learner="svm")

## Creating a standardWF 
Workflow(learner="randomForest",learner.pars=list(ntree=420),wfID="rf420")

## Another one
Workflow(learner="svm",
         pre=c("centralImp","scale"),
         post="onlyPos",
         deps=list(packages=c("e1071"),scripts=c()))

## Another one
Workflow(learner="rpart",.fullOutput=TRUE)

## A user-defined workflow
myWF <- function(form,train,test,wL=0.5,...) {
    ml <- lm(form,train)
    mr <- rpart(form,train)
    pl <- predict(ml,test)
    pr <- predict(mr,test)
    ps <- wL*pl+(1-wL)*pr
    list(trues=responseValues(form,test),preds=ps)
}

wu <- Workflow(wf="myWF",wL=0.6)




