## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, message=FALSE------------------------------------------
library(greybox)

## ----BJxreg1-------------------------------------------------------------
BJxreg <- xregExpander(BJsales.lead,lags=c(-5,-10))

## ----BJxreg2-------------------------------------------------------------
BJxreg <- xregExpander(BJsales.lead,lags=c(7,-5,-10))

## ----BJxreg3-------------------------------------------------------------
BJxreg <- xregExpander(BJsales.lead,lags=c(-10:10))

## ----BJData--------------------------------------------------------------
BJxreg <- as.data.frame(xregExpander(BJsales.lead,lags=c(-10:10)))
BJxreg <- cbind(as.matrix(BJsales),BJxreg)
colnames(BJxreg)[1] <- "y"
ourModel <- stepwise(BJxreg)

## ----BJStepwise----------------------------------------------------------
ourModel <- stepwise(BJxreg)

## ----BJStepwiseResult----------------------------------------------------
ourModel

## ----BJcombine1----------------------------------------------------------
ourModel <- lmCombine(BJxreg[,-c(3:7,18:22)],bruteForce=TRUE)
summary(ourModel)

## ----BJcombine2----------------------------------------------------------
ourModel <- lmCombine(BJxreg,bruteForce=FALSE)
summary(ourModel)

## ----BJcombine3----------------------------------------------------------
BJInsample <- BJxreg[1:130,];
BJHoldout <- BJxreg[-(1:130),];
ourModel <- lmCombine(BJInsample,bruteForce=FALSE)

## ----BJcombinePlot-------------------------------------------------------
summary(ourModel)
plot(ourModel)

## ----BJcombineForecast---------------------------------------------------
ourForecast <- predict(ourModel,BJHoldout)
plot(ourForecast)

## ----BJDynamicModel------------------------------------------------------
ourModel <- lmDynamic(BJInsample,bruteForce=FALSE)

## ----BJDynamicPlot-------------------------------------------------------
ourSummary <- summary(ourModel)
ourSummary
plot(ourModel)

## ----BJDynamicCoefficients-----------------------------------------------
# Coefficients in dynamics
head(ourModel$coefficientsDynamic)
# Standard errors of the coefficients in dynamics
head(ourModel$se)
# Importance of parameters in dynamics
head(ourModel$importance)

## ----BJDynamicCoefficientsPlots, eval=FALSE, include=FALSE---------------
#  plot(coef(ourModel))

## ----BJDynamicdf---------------------------------------------------------
ourModel$dfDynamic
ourModel$df.residualDynamic

## ----BJDynamicForecast---------------------------------------------------
ourForecast <- predict(ourModel,BJHoldout)
plot(ourForecast)

