library(DynTxRegime)


### Name: .newTypedSimpleFit
### Title: Complete Outcome Regression Step When Single Model.
### Aliases: .newTypedSimpleFit
###   .newTypedSimpleFit,modelObj,modelObj,TxInfoNoSubsets-method
###   .newTypedSimpleFit,NULL,modelObj,TxInfoNoSubsets-method
###   .newTypedSimpleFit,modelObj,NULL,TxInfoNoSubsets-method
###   .newTypedSimpleFit,modelObj,modelObj,TxInfoWithSubsets-method
###   .newTypedSimpleFit,NULL,modelObj,TxInfoWithSubsets-method
###   .newTypedSimpleFit,modelObj,NULL,TxInfoWithSubsets-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100

moMain <- buildModelObj(model = ~ parentBMI + baselineBMI + month4BMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~ parentBMI + baselineBMI + month4BMI, 
                        solver.method = 'lm')

# Treatment Object
txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newTypedSimpleFit(moMain = moMain, 
                                        moCont = moCont,  
                                        txInfo = txInfo, 
                                        data = bmiData,  
                                        response = y,  
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

obj <- DynTxRegime:::.newTypedSimpleFit(moMain = moMain, 
                                        moCont = NULL,  
                                        txInfo = txInfo, 
                                        data = bmiData,  
                                        response = y,  
                                        suppress = TRUE)

is(obj)
print(obj)

obj <- DynTxRegime:::.newTypedSimpleFit(moMain = NULL, 
                                        moCont = moCont,  
                                        txInfo = txInfo, 
                                        data = bmiData,  
                                        response = y,  
                                        suppress = TRUE)


is(obj)
print(obj)

fSet <- function(data){
          subsets <- list(list("subset1", c("CD","MR")),
                          list("subset2", c("CD","MR")))
         txOpts <- character(nrow(data))
         txOpts[data$A1 == "CD"] <- "subset1"
         txOpts[data$A1 == "MR"] <- "subset2"
         return(list("subsets" = subsets, "txOpts" = txOpts))
        }

# Integer treatment with subsetting
txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newTypedSimpleFit(moMain = moMain, 
                                        moCont = moCont, 
                                        txInfo = txInfo, 
                                        data = bmiData, 
                                        response = y, 
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


obj <- DynTxRegime:::.newTypedSimpleFit(moMain = moMain, 
                                        moCont = NULL, 
                                        txInfo = txInfo, 
                                        data = bmiData, 
                                        response = y, 
                                        suppress = TRUE)

is(obj)
print(obj)

obj <- DynTxRegime:::.newTypedSimpleFit(moMain = NULL, 
                                        moCont = moCont, 
                                        txInfo = txInfo, 
                                        data = bmiData, 
                                        response = y, 
                                        suppress = TRUE)
is(obj)
print(obj)




