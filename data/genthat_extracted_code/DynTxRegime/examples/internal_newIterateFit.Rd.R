library(DynTxRegime)


### Name: .newIterateFit
### Title: Complete Outcome Regression Step When Two Component Model.
### Aliases: .newIterateFit
###   .newIterateFit,modelObj,modelObj,TxInfoNoSubsets-method
###   .newIterateFit,modelObj,modelObj,TxInfoWithSubsets-method
### Keywords: internal

### ** Examples


data(bmiData)

bmiData$A2 <- as.factor(bmiData$A2)

moMain <- buildModelObj(model = ~month4BMI + baselineBMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~month4BMI + baselineBMI, 
                        solver.method = 'lm')

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100

# Treatment Object
txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, 
                                   txName = "A1", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newIterateFit(moMain = moMain, 
                                    moCont = moCont, 
                                    txInfo = txInfo, 
                                    data = bmiData, 
                                    response = y, 
                                    max.iter = 100L, 
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
                           list("subset2",c("MR")))
           txOpts <- character(nrow(data))
           txOpts[data$baselineBMI <= 35] <- "subset2"
           txOpts[data$baselineBMI > 35] <- "subset1"
           return(list("subsets" = subsets, "txOpts" = txOpts))
         }

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet1, 
                                   txName = "A2", 
                                   data = bmiData, 
                                   suppress = TRUE, 
                                   verify = TRUE)

obj <- DynTxRegime:::.newIterateFit(moMain = moMain, 
                                    moCont = moCont, 
                                    txInfo = txInfo, 
                                    data = bmiData, 
                                    response = y, 
                                    max.iter = 100L, 
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



