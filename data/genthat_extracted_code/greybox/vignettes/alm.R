## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(greybox)

## ----mixtureExampleData--------------------------------------------------
xreg <- cbind(rlaplace(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rlaplace(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")

xreg[,1] <- round(exp(xreg[,1]-70) / (1 + exp(xreg[,1]-70)),0) * round(xreg[,1]-70)
inSample <- xreg[1:80,]
outSample <- xreg[-c(1:80),]

## ----mixtureExampleOccurrence--------------------------------------------
modelOccurrence <- alm(y~x1+x2+Noise, inSample, distribution="plogis")

## ----mixtureExampleFinal-------------------------------------------------
modelMixture <- alm(y~x1+x2+Noise, inSample, distribution="dlnorm", occurrence=modelOccurrence)

## ----mixtureSummary------------------------------------------------------
summary(modelMixture)
summary(modelMixture$occurrence)

## ----mixturePredict------------------------------------------------------
predict(modelMixture,outSample,interval="p")

