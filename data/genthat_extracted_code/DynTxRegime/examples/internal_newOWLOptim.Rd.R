library(DynTxRegime)


### Name: .newOWLOptim
### Title: Optimization Routine - Outcome Weighted Learning.
### Aliases: .newOWLOptim .newOWLOptim,matrix-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100
y <- y - min(y)

regime <- ~ parentBMI + baselineBMI + gender
x <- model.matrix(regime, bmiData)

txVec <- numeric(nrow(bmiData)) - 1L
txVec[bmiData$A2 == "MR"] <- 1L
bmiData$A2 <- as.factor(bmiData$A2)

obj <- DynTxRegime:::.newOWLOptim(x = x,
                                  subset = 1L:nrow(bmiData),
                                  lambda = 0.1,
                                  txVec = txVec,
                                  prWgt = numeric(nrow(bmiData)) + 0.5,
                                  response = y,
                                  suppress = TRUE,
                                  kernel = 'linear',
                                  kparam = NULL)
is(obj)




