library(DynTxRegime)


### Name: .newIQLearnSS
### Title: First Step of IQ-Learning Algorithm
### Aliases: .newIQLearnSS .newIQLearnSS,modelObj,modelObj-method
###   .newIQLearnSS,modelObj,NULL-method .newIQLearnSS,NULL,modelObj-method
### Keywords: internal

### ** Examples

data(bmiData)

bmiData$A2 <- as.factor(bmiData$A2)

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

is(obj1)

coef(obj1)
DTRstep(obj1)
fitObject(obj1)
fittedCont(obj1)
fittedMain(obj1)
optTx(obj1)
optTx(obj1,bmiData)
outcome(obj1)
plot(obj1)
propen(obj1)
show(obj1)
summary(obj1)



