library(DynTxRegime)


### Name: .newIQLearnFS_VHet
### Title: Fourth Step of IQ-Learning Algorithm
### Aliases: .newIQLearnFS_VHet
###   .newIQLearnFS_VHet,IQLearnFS_C,modelObj,modelObj-method
###   .newIQLearnFS_VHet,IQLearnFS_C,modelObj,NULL-method
###   .newIQLearnFS_VHet,IQLearnFS_C,NULL,modelObj-method
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

obj3 <- DynTxRegime:::.newIQLearnFS_VHet(object = obj2, 
                                         moMain = moMain, 
                                         moCont = moCont,
                                         data = bmiData, 
                                         iter = 0L, 
                                         suppress = TRUE)

is(obj3)

coef(obj3)
DTRstep(obj3)
fitObject(obj3)
outcome(obj3)
plot(obj3)
propen(obj3)
show(obj3)
summary(obj3)



