library(DynTxRegime)


### Name: .newPropensityRegression
### Title: Complete Propensity Score Regression Step.
### Aliases: .newPropensityRegression
###   .newPropensityRegression,modelObj,TxInfoNoSubsets-method
###   .newPropensityRegression,modelObj,TxInfoWithSubsets-method
###   .newPropensityRegression,ModelObj_SubsetList,TxInfoWithSubsets-method
###   .newPropensityRegression,ModelObj_DecisionPointList,TxInfoList-method
###   .newPropensityRegression,ModelObj_SubsetList_DecisionPointList,TxInfoList-method
### Keywords: internal

### ** Examples


data(bmiData)
bmiData$A2 <- as.factor(bmiData$A2)
bmiData$A1 <- as.factor(bmiData$A1)

moPropen <- buildModelObj(model = ~1, 
                          solver.method = 'glm',
                          solver.args = list("family"="binomial"),
                          predict.args = list("type" = "response"))

txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newPropensityRegression(moPropen = moPropen,
                                              txInfo = txInfo,
                                              data = bmiData,
                                              suppress = TRUE)

is(obj)
coef(object = obj)
fitObject(object = obj)
plot(x = obj)
predict(object = obj)
predict(object = obj, newdata = bmiData)
print(obj)
show(object = obj)
summary(object = obj)

fSet <- function(data){
          subsets <- list(list("subset1", c("CD","MR")),
                          list("subset2", c("CD")))

          txOpts <- character(nrow(data))
          txOpts[data$A1 == "MR"] <- "subset1"
          txOpts[data$A1 == "CD"] <- "subset2"

          return(list("subsets" = subsets,
                      "txOpts" = txOpts))
        }

bmiData$A3 <- bmiData$A2
bmiData$A3[bmiData$A1 == "CD"] <- "CD"

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, 
                                   txName = "A3", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newPropensityRegression(moPropen = moPropen,
                                              txInfo = txInfo,
                                              data = bmiData,
                                              suppress = TRUE)

is(obj)
coef(object = obj)
fitObject(object = obj)
plot(x = obj)
predict(object = obj)
predict(object = obj, newdata = bmiData)
print(obj)
show(object = obj)
summary(object = obj)


fSet <- function(data){
          subsets <- list(list("subset1", c("CD","MR")),
                          list("subset2", c("CD","MR")))

          txOpts <- character(nrow(data))
          txOpts[data$A1 == "MR"] <- "subset1"
          txOpts[data$A1 == "CD"] <- "subset2"

          return(list("subsets" = subsets,
                      "txOpts" = txOpts))
        }

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

moPropenSS <- list()

moPropenSS[[1L]] <- buildModelObjSubset(model = ~1, 
                                        solver.method = 'glm',
                                        solver.args = list("family"="binomial"),
                                        predict.args = list("type" = "response"),
                                        subset = "subset1")

moPropenSS[[2L]] <- buildModelObjSubset(model = ~1, 
                                        solver.method = 'glm',
                                        solver.args = list("family"="binomial"),
                                        predict.args = list("type" = "response"),
                                        subset = "subset2")

moPropenSS <- DynTxRegime:::.newModelObjSubset(moPropenSS)

obj <- DynTxRegime:::.newPropensityRegression(moPropen = moPropenSS,
                                              txInfo = txInfo,
                                              data = bmiData,
                                              suppress = TRUE)

is(obj)
coef(object = obj)
fitObject(object = obj)
plot(x = obj)
predict(object = obj)
predict(object = obj, newdata = bmiData)
print(obj)
show(object = obj)
summary(object = obj)

txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, 
                                   txName = list("A1","A2"), 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

moPropenDP <- list()

moPropenDP[[1L]] <- buildModelObj(model = ~1, 
                                  solver.method = 'glm',
                                  solver.args = list("family"="binomial"),
                                  predict.args = list("type" = "response"))

moPropenDP[[2L]] <- buildModelObj(model = ~1, 
                                  solver.method = 'glm',
                                  solver.args = list("family"="binomial"),
                                  predict.args = list("type" = "response"))

moPropenDP <- DynTxRegime:::.checkModelObjOrModelObjSubsetOrList(moPropenDP, "moPropen")

obj <- DynTxRegime:::.newPropensityRegression(moPropen = moPropenDP,
                                              txInfo = txInfo,
                                              data = bmiData,
                                              suppress = TRUE)

is(obj)
coef(object = obj)
fitObject(object = obj)
plot(x = obj)
predict(object = obj)
predict(object = obj, newdata = bmiData)
print(obj)
show(object = obj)
summary(object = obj)


fSet <- list()

fSet[[1L]] <- function(data){
                subsets <- list(list("subset1", c("CD","MR")))

                txOpts <- character(nrow(data))
                txOpts[] <- "subset1"

                return(list("subsets" = subsets,
                            "txOpts" = txOpts))
        }

fSet[[2L]] <- function(data){
                subsets <- list(list("subset1", c("CD","MR")),
                                list("subset2", c("CD","MR")))

                txOpts <- character(nrow(data))
                txOpts[data$A1 == "MR"] <- "subset1"
                txOpts[data$A1 == "CD"] <- "subset2"

                return(list("subsets" = subsets,
                            "txOpts" = txOpts))
              }

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, 
                                   txName = list("A1","A2"), 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)


obj <- DynTxRegime:::.newPropensityRegression(moPropen = moPropenDP,
                                              txInfo = txInfo,
                                              data = bmiData,
                                              suppress = TRUE)

is(obj)
coef(object = obj)
fitObject(object = obj)
plot(x = obj)
predict(object = obj)
predict(object = obj, newdata = bmiData)
print(obj)
show(object = obj)
summary(object = obj)


moPropenSSDP <- list()

moPropenSSDP[[1L]] <- buildModelObjSubset(model = ~1, 
                                          solver.method = 'glm',
                                          solver.args = list("family"="binomial"),
                                          predict.args = list("type" = "response"),
                                          subset = "subset1",
                                          dp = 1L)

moPropenSSDP[[2L]] <- buildModelObjSubset(model = ~1, 
                                          solver.method = 'glm',
                                          solver.args = list("family"="binomial"),
                                          predict.args = list("type" = "response"),
                                          subset = "subset1",
                                         dp = 2L)

moPropenSSDP[[3L]] <- buildModelObjSubset(model = ~1, 
                                          solver.method = 'glm',
                                          solver.args = list("family"="binomial"),
                                          predict.args = list("type" = "response"),
                                          subset = "subset2",
                                          dp = 2L)

moPropenSSDP <- DynTxRegime:::.newModelObjSubset(moPropenSSDP)

obj <- DynTxRegime:::.newPropensityRegression(moPropen = moPropenSSDP,
                                              txInfo = txInfo,
                                              data = bmiData,
                                              suppress = TRUE)

is(obj)
coef(object = obj)
fitObject(object = obj)
plot(x = obj)
predict(object = obj)
predict(object = obj, newdata = bmiData)
print(obj)
show(object = obj)
summary(object = obj)




