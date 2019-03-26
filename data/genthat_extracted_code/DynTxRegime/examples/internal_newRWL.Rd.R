library(DynTxRegime)


### Name: .newRWL
### Title: Residual Weighted Learning.
### Aliases: .newRWL .newRWL,modelObj,modelObj-method
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
## Not run: 
##D obj <- DynTxRegime:::.newRWL(moPropen = moPropen,
##D                              moMain = moMain,
##D                              data = bmiData,
##D                              response = y,
##D                              txName = "A2",
##D                              regime = regime,
##D                              lambdas = 0.1,
##D                              cvFolds = 0L,
##D                              kernel = "linear",
##D                              kparam = NULL,
##D                              responseType = "continuous",
##D                              txVec = txVec,
##D                              guess = NULL,
##D                              suppress = TRUE)
##D 
##D is(obj)
##D coef(obj)
##D cvInfo(obj)
##D DTRstep(obj)
##D estimator(obj)
##D fitObject(obj)
##D optimObj(obj)
##D optTx(obj)
##D optTx(obj,bmiData)
##D outcome(obj)
##D print(obj)
##D propen(obj)
##D regimeCoef(obj)
##D show(obj)
##D summary(obj)
##D 
##D obj <- DynTxRegime:::.newRWL(moPropen = moPropen,
##D                              moMain = moMain,
##D                              data = bmiData,
##D                              response = y,
##D                              txName = "A2",
##D                              regime = regime,
##D                              lambdas = c(0.1,0.2),
##D                              cvFolds = 4L,
##D                              kernel = "linear",
##D                              kparam = NULL,
##D                              responseType = "continuous",
##D                              txVec = txVec,
##D                              guess = NULL,
##D                              suppress = TRUE)
##D 
##D is(obj)
##D coef(obj)
##D cvInfo(obj)
##D DTRstep(obj)
##D estimator(obj)
##D fitObject(obj)
##D optimObj(obj)
##D optTx(obj)
##D optTx(obj,bmiData)
##D outcome(obj)
##D print(obj)
##D propen(obj)
##D regimeCoef(obj)
##D show(obj)
##D summary(obj)
##D 
##D 
##D obj <- DynTxRegime:::.newRWL(moPropen = moPropen,
##D                              moMain = moMain,
##D                              data = bmiData,
##D                              response = y,
##D                              txName = "A2",
##D                              regime = regime,
##D                              lambdas = c(0.1,0.2),
##D                              cvFolds = 4L,
##D                              kernel = "radial",
##D                              kparam = c(1,2),
##D                              responseType = "continuous",
##D                              txVec = txVec,
##D                              guess = NULL,
##D                              suppress = TRUE)
##D 
##D is(obj)
##D coef(obj)
##D cvInfo(obj)
##D DTRstep(obj)
##D estimator(obj)
##D fitObject(obj)
##D optimObj(obj)
##D optTx(obj)
##D optTx(obj,bmiData)
##D outcome(obj)
##D print(obj)
##D propen(obj)
##D regimeCoef(obj)
##D show(obj)
##D summary(obj)
##D 
##D obj <- DynTxRegime:::.newRWL(moPropen = moPropen,
##D                              moMain = moMain,
##D                              data = bmiData,
##D                              response = y,
##D                              txName = "A2",
##D                              regime = regime,
##D                              lambdas = 0.1,
##D                              cvFolds = 4L,
##D                              kernel = "radial",
##D                              kparam = c(1,2),
##D                              responseType = "continuous",
##D                              txVec = txVec,
##D                              guess = NULL,
##D                              suppress = TRUE)
##D 
##D is(obj)
##D coef(obj)
##D cvInfo(obj)
##D DTRstep(obj)
##D estimator(obj)
##D fitObject(obj)
##D optimObj(obj)
##D optTx(obj)
##D optTx(obj,bmiData)
##D outcome(obj)
##D print(obj)
##D propen(obj)
##D regimeCoef(obj)
##D show(obj)
##D summary(obj)
## End(Not run)



