library(DynTxRegime)


### Name: .newOutcomeRegression
### Title: Complete Outcome Regression Step When Subset Modeling Not Used
###   In Regression.
### Aliases: .newOutcomeRegression
###   .newOutcomeRegression,modelObj,modelObj,TxInfoBasic-method
###   .newOutcomeRegression,NULL,modelObj,TxInfoBasic-method
###   .newOutcomeRegression,modelObj,NULL,TxInfoBasic-method
###   .newOutcomeRegression,ModelObj_SubsetList,ModelObj_SubsetList,TxInfoWithSubsets-method
###   .newOutcomeRegression,NULL,ModelObj_SubsetList,TxInfoWithSubsets-method
###   .newOutcomeRegression,ModelObj_SubsetList,NULL,TxInfoWithSubsets-method
###   .newOutcomeRegression,ModelObj_DecisionPointList,ModelObj_DecisionPointList,TxInfoList-method
###   .newOutcomeRegression,NULL,ModelObj_DecisionPointList,TxInfoList-method
###   .newOutcomeRegression,ModelObj_DecisionPointList,NULL,TxInfoList-method
###   .newOutcomeRegression,ModelObj_SubsetList_DecisionPointList,ModelObj_SubsetList_DecisionPointList,TxInfoList-method
###   .newOutcomeRegression,NULL,ModelObj_SubsetList_DecisionPointList,TxInfoList-method
###   .newOutcomeRegression,ModelObj_SubsetList_DecisionPointList,NULL,TxInfoList-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$baselineBMI) / bmiData$baselineBMI * 100

bmiData$A2 <- as.factor(bmiData$A2)

moPropen <- buildModelObj(model = ~1, 
                          solver.method = 'glm',
                          solver.args = list("family" = "binomial"),
                          predict.args = list("type" = "response"))

moMain <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')

# Treatment Object
txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, 
                                   txName = "A1", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = moMain, 
                                           moCont = moCont, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           iter = 100L, 
                                           suppress = TRUE)

is(obj)
coef(obj)
fitObject(obj)
plot(obj)
predict(obj)
predict(obj, bmiData)
DynTxRegime:::.predictAllTreatments(object = obj, data = bmiData)
print(obj)
show(obj)
summary(obj)

fSet1 <- function(data){
           subsets <- list(list("subset1",c("CD","MR")),
                           list("subset2",c("CD","MR")))
           txOpts <- character(nrow(data))
           txOpts[data$baselineBMI <= 35] <- "subset2"
           txOpts[data$baselineBMI > 35] <- "subset1"
           return(list("subsets" = subsets, "txOpts" = txOpts))
         }

moMain <- list()
moMain[[1L]] <- buildModelObjSubset(model = ~parentBMI+baselineBMI+month4BMI, 
                                    solver.method = 'lm',
                                    subset = "subset1")
moMain[[2L]] <- buildModelObjSubset(model = ~parentBMI+baselineBMI+month4BMI, 
                                    solver.method = 'lm',
                                    subset = "subset1")
moCont <- list()
moCont[[1L]] <- buildModelObjSubset(model = ~parentBMI+baselineBMI+month4BMI, 
                                    solver.method = 'lm',
                                    subset = "subset1")
moCont[[2L]] <- buildModelObjSubset(model = ~parentBMI+baselineBMI+month4BMI, 
                                    solver.method = 'lm',
                                    subset = "subset2")

moMain <- DynTxRegime:::.newModelObjSubset(moMain)
moCont <- DynTxRegime:::.newModelObjSubset(moCont)

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet1, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = moMain, 
                                           moCont = moCont, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           iter = 100L, 
                                           suppress = TRUE)

is(obj)
coef(obj)
fitObject(obj)
plot(obj)
predict(obj)
predict(obj, bmiData)
DynTxRegime:::.predictAllTreatments(object = obj, data = bmiData)
print(obj)
show(obj)
summary(obj)

moMain <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')

# Treatment Object
txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = moMain, 
                                           moCont = moCont, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           iter = 0L, 
                                           suppress = TRUE)

is(obj)
coef(obj)
fitObject(obj)
plot(obj)
predict(obj)
predict(obj, bmiData)
DynTxRegime:::.predictAllTreatments(object = obj, data = bmiData)
print(obj)
show(obj)
summary(obj)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = moMain, 
                                           moCont = NULL, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           iter = 0L, 
                                           suppress = TRUE)

is(obj)
print(obj)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = NULL, 
                                           moCont = moCont, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           iter = 0L, 
                                           suppress = TRUE)

is(obj)
print(obj)

bmiData$A3 <- bmiData$A2
bmiData$A3[bmiData$A1 == "CD"] <- "CD"

fSet1 <- function(data){
           subsets <- list(list("subset1",c("CD","MR")),
                           list("subset2",c("CD")))
           txOpts <- character(nrow(data))
           txOpts[data$A1 == "CD"] <- "subset2"
           txOpts[data$A1 == "MR"] <- "subset1"
           return(list("subsets" = subsets, "txOpts" = txOpts))
         }

# Integer treatment with subsetting
txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet1, 
                                   txName = "A3",  
                                   data = bmiData,  
                                   suppress = TRUE,  
                                   verify = TRUE)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = moMain, 
                                           moCont = moCont, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           suppress = TRUE, 
                                           iter = 0L)

is(obj)
coef(obj)
fitObject(obj)
plot(obj)
predict(obj)
predict(obj, bmiData)
DynTxRegime:::.predictAllTreatments(object = obj, data = bmiData)
print(obj)
show(obj)
summary(obj)


obj <- DynTxRegime:::.newOutcomeRegression(moMain = moMain, 
                                           moCont = NULL, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           suppress = TRUE, 
                                           iter = 0L)

is(obj)
print(obj)

obj <- DynTxRegime:::.newOutcomeRegression(moMain = NULL, 
                                           moCont = moCont, 
                                           txInfo = txInfo, 
                                           data = bmiData, 
                                           response = y, 
                                           suppress = TRUE, 
                                           iter = 0L)

is(obj)
print(obj)




