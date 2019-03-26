library(DynTxRegime)


### Name: .newIQLearnFS_C
### Title: Second Step of IQ-Learning Algorithm
### Aliases: .newIQLearnFS_C .newIQLearnFS_C,modelObj,modelObj-method
###   .newIQLearnFS_C,modelObj,NULL-method
###   .newIQLearnFS_C,NULL,modelObj-method
### Keywords: internal

### ** Examples


data(bmiData)

bmiData$A2 <- as.factor(bmiData$A2)
bmiData$A1 <- as.factor(bmiData$A1)

moMain <- buildModelObj(model = ~month4BMI + baselineBMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~month4BMI + baselineBMI, 
                        solver.method = 'lm')

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100

obj1 <- DynTxRegime:::.newIQLearnSS(moMain = moMain, 
                                    moCont = moCont, 
                                    response = y,
                                    data = bmiData, 
                                    txName = 'A2', 
                                    iter = 0L, 
                                    suppress = TRUE)


moMain <- buildModelObj(model = ~baselineBMI + parentBMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~baselineBMI + parentBMI, 
                        solver.method = 'lm')

obj2 <- DynTxRegime:::.newIQLearnFS_C(moMain = moMain, 
                                      moCont = moCont,  
                                      response = obj1,
                                      data = bmiData,  
                                      txName = 'A1',  
                                      iter = 0L,  
                                      suppress = TRUE)

is(obj2)

coef(obj2)
DTRstep(obj2)
fitObject(obj2)
outcome(obj2)
plot(obj2)
propen(obj2)
show(obj2)
summary(obj2)



