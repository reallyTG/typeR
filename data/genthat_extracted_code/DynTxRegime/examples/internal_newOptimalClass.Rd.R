library(DynTxRegime)


### Name: .newOptimalClass
### Title: Optimal Treatment Regime from Classification Perspective.
### Aliases: .newOptimalClass
###   .newOptimalClass,modelObj,modelObj,modelObj,modelObj-method
###   .newOptimalClass,modelObj,modelObj,NULL,modelObj-method
###   .newOptimalClass,modelObj,NULL,modelObj,modelObj-method
###   .newOptimalClass,modelObj,NULL,NULL,modelObj-method
### Keywords: internal

### ** Examples


data(bmiData)
library(rpart)

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100

bmiData$A2 <- as.factor(bmiData$A2)

moPropen <- buildModelObj(model = ~1, 
                          solver.method = 'glm',
                          solver.args = list("family" = "binomial"),
                          predict.args = list("type" = "response"))

moMain <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')

moClass <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                         solver.method = 'rpart',
                         predict.args = list("type"="class"))


obj <- DynTxRegime:::.newOptimalClass(moPropen = moPropen,
                                      moMain = NULL, 
                                      moCont = NULL, 
                                      moClass = moClass,
                                      data = bmiData,
                                      response = y,
                                      txName = 'A2', 
                                      suppress = TRUE)

is(obj)

coef(obj)
DTRstep(obj)
estimator(obj)
fitObject(obj)
optTx(obj)
optTx(obj,bmiData)
outcome(obj)
plot(obj)
propen(obj)
show(obj)
summary(obj)

obj <- DynTxRegime:::.newOptimalClass(moPropen = moPropen,
                                      moMain = moMain, 
                                      moCont = moCont, 
                                      moClass = moClass,
                                      data = bmiData,
                                      response = y,
                                      txName = 'A2', 
                                      iter = 0L,
                                      suppress = TRUE)

is(obj)

coef(obj)
DTRstep(obj)
estimator(obj)
fitObject(obj)
optTx(obj)
optTx(obj,bmiData)
outcome(obj)
plot(obj)
propen(obj)
show(obj)
summary(obj)




