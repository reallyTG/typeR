library(DynTxRegime)


### Name: .newOWL
### Title: Outcome Weighted Learning.
### Aliases: .newOWL .newOWL,modelObj-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100

moPropen <- buildModelObj(model = ~1, 
                          solver.method = 'glm',
                          solver.args = list("family" = "binomial"),
                          predict.args = list("type" = "response"))

regime <- ~ parentBMI + baselineBMI + gender

txVec <- numeric(nrow(bmiData)) - 1L
txVec[bmiData$A2 == "MR"] <- 1L
bmiData$A2 <- as.factor(bmiData$A2)

obj <- DynTxRegime:::.newOWL(moPropen = moPropen,
                             data = bmiData,
                             reward = y,
                             txName = "A2",
                             regime = regime,
                             lambdas = 0.1,
                             cvFolds = 0L,
                             kernel = "linear",
                             kparam = NULL,
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

obj <- DynTxRegime:::.newOWL(moPropen = moPropen,
                             data = bmiData,
                             reward = y,
                             txName = "A2",
                             regime = regime,
                             lambdas = c(0.1,0.2),
                             cvFolds = 4L,
                             kernel = "linear",
                             kparam = NULL,
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


obj <- DynTxRegime:::.newOWL(moPropen = moPropen,
                             data = bmiData,
                             reward = y,
                             txName = "A2",
                             regime = regime,
                             lambdas = c(0.1,0.2),
                             cvFolds = 4L,
                             kernel = "radial",
                             kparam = c(1.0,2.0),
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

obj <- DynTxRegime:::.newOWL(moPropen = moPropen,
                             data = bmiData,
                             reward = y,
                             txName = "A2",
                             regime = regime,
                             lambdas = 0.1,
                             cvFolds = 4L,
                             kernel = "radial",
                             kparam = c(1.0,2.0),
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




