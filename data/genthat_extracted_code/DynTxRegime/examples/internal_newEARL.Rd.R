library(DynTxRegime)


### Name: .newEARL
### Title: Efficient Augmentation and Relaxation Learning.
### Aliases: .newEARL .newEARL,modelObj,NULL,NULL-method
###   .newEARL,modelObj,modelObj,modelObj-method
###   .newEARL,modelObj,modelObj,NULL-method
###   .newEARL,modelObj,NULL,modelObj-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100

moPropen <- buildModelObj(model = ~1, 
                          solver.method = 'glm',
                          solver.args = list("family" = "binomial"),
                          predict.args = list("type" = "response"))

moMain <- buildModelObj(model = ~ parentBMI + baselineBMI + month4BMI, 
                        solver.method = 'lm')

regime <- ~ parentBMI + baselineBMI + gender

txVec <- numeric(nrow(bmiData)) - 1L
txVec[bmiData$A2 == "MR"] <- 1L
bmiData$A2 <- as.factor(bmiData$A2)

obj <- DynTxRegime:::.newEARL(moPropen = moPropen,
                              moMain = NULL,
                              moCont = NULL,
                              data = bmiData,
                              response = y,
                              txName = "A2",
                              regime = regime,
                              lambdas = 0.1,
                              cvFolds = 0L,
                              surrogate = "hinge",
                              guess = NULL,
                              txVec = txVec,
                              suppress = TRUE)

is(obj)
coef(obj)
cvInfo(obj)
DTRstep(obj)
estimator(obj)
fitObject(obj)
optimObj(obj)
optTx(obj)
optTx(obj,bmiData)
outcome(obj)
print(obj)
propen(obj)
regimeCoef(obj)
show(obj)
summary(obj)

obj <- DynTxRegime:::.newEARL(moPropen = moPropen,
                              moMain = moMain,
                              moCont = moMain,
                              data = bmiData,
                              response = y,
                              txName = "A2",
                              regime = regime,
                              lambdas = c(0.1,0.2),
                              cvFolds = 4L,
                              surrogate = "hinge",
                              guess = NULL,
                              txVec = txVec,
                              iter = 0L,
                              suppress = TRUE)

is(obj)
coef(obj)
cvInfo(obj)
DTRstep(obj)
estimator(obj)
fitObject(obj)
optimObj(obj)
optTx(obj)
optTx(obj,bmiData)
outcome(obj)
print(obj)
propen(obj)
regimeCoef(obj)
show(obj)
summary(obj)




