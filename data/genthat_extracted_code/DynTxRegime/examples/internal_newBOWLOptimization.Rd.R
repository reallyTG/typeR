library(DynTxRegime)


### Name: .newBOWLOptimization
### Title: Backward Outcome Weighted Learning With and Without Subsetting
###   of Regime.
### Aliases: .newBOWLOptimization .newBOWLOptimization,formula-method
###   .newBOWLOptimization,list-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$month4BMI) / bmiData$month4BMI * 100
miny <- min(y)
if(miny < 0.0) y <- y - miny

prWgt <- numeric(nrow(bmiData)) + 0.5

regime <- ~ parentBMI + baselineBMI + gender

txVec <- numeric(nrow(bmiData)) - 1L
txVec[bmiData$A2 == "MR"] <- 1L
bmiData$A2 <- as.factor(bmiData$A2)

txInfo <- DynTxRegime:::.newTxInfo(fSet = NULL, txName = "A2", data = bmiData, 
                                   suppress = TRUE, verify = TRUE)

obj <- DynTxRegime:::.newBOWLOptimization(regime = regime,
                                          txInfo = txInfo,
                                          ind = !logical(nrow(bmiData)),
                                          prWgt = prWgt,
                                          response = y,
                                          txVec = txVec,
                                          data = bmiData,
                                          kernel = "linear",
                                          kparam = NULL,
                                          lambdas = 0.1,
                                          cvFolds = 0L,
                                          suppress = TRUE)

is(obj)
cvInfo(obj)
optimObj(obj)
DynTxRegime:::.predictOptimalTx(obj)
DynTxRegime:::.predictOptimalTx(obj,bmiData)
print(obj)
regimeCoef(obj)
show(obj)
summary(obj)


obj <- DynTxRegime:::.newBOWLOptimization(regime = regime,
                                          txInfo = txInfo,
                                          ind = !logical(nrow(bmiData)),
                                          prWgt = prWgt,
                                          response = y,
                                          txVec = txVec,
                                          data = bmiData,
                                          kernel = "linear",
                                          kparam = NULL,
                                          lambdas = c(0.1,0.2,0.3),
                                          cvFolds = 4L,
                                          suppress = TRUE)

is(obj)
cvInfo(obj)
optimObj(obj)
DynTxRegime:::.predictOptimalTx(obj)
DynTxRegime:::.predictOptimalTx(obj,bmiData)
print(obj)
regimeCoef(obj)
show(obj)
summary(obj)

fSet <- function(data){
          subsets = list(list("subset1", c("CD","MR")),
                         list("subset2", c("CD","MR")))
          txOpts <- character(nrow(data))
          txOpts[data$A1 == "CD"] <- "subset1"
          txOpts[data$A1 == "MR"] <- "subset2"

          return(list("subsets" = subsets, "txOpts" = txOpts))
        }

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, txName = "A2", data = bmiData, 
                                   suppress = TRUE, verify = TRUE)

obj <- DynTxRegime:::.newBOWLOptimization(regime = list("subset1"=regime,"subset2"=regime),
                                          txInfo = txInfo,
                                          ind = !logical(nrow(bmiData)),
                                          prWgt = prWgt,
                                          response = y,
                                          txVec = txVec,
                                          data = bmiData,
                                          kernel = "linear",
                                          kparam = NULL,
                                          lambdas = 0.1,
                                          cvFolds = 0L,
                                          suppress = TRUE)

is(obj)
cvInfo(obj)
optimObj(obj)
DynTxRegime:::.predictOptimalTx(obj)
DynTxRegime:::.predictOptimalTx(obj,bmiData)
print(obj)
regimeCoef(obj)
show(obj)
summary(obj)

bmiData$A2[bmiData$A1 == "MR"] <- "CD"

fSet <- function(data){
          subsets = list(list("subset1", c("CD","MR")),
                         list("subset2", c("CD")))
          txOpts <- character(nrow(data))
          txOpts[data$A1 == "CD"] <- "subset1"
          txOpts[data$A1 == "MR"] <- "subset2"

          return(list("subsets" = subsets, "txOpts" = txOpts))
        }

prWgt[bmiData$A1 == "MR"] <- 1.0

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, txName = "A2", data = bmiData, 
                                   suppress = TRUE, verify = TRUE)

obj <- DynTxRegime:::.newBOWLOptimization(regime = regime,
                                          txInfo = txInfo,
                                          ind = !logical(nrow(bmiData)),
                                          prWgt = prWgt,
                                          response = y,
                                          txVec = txVec,
                                          data = bmiData,
                                          kernel = "linear",
                                          kparam = NULL,
                                          lambdas = 0.1,
                                          cvFolds = 0L,
                                          suppress = TRUE)

is(obj)
cvInfo(obj)
optimObj(obj)
DynTxRegime:::.predictOptimalTx(obj)
DynTxRegime:::.predictOptimalTx(obj,bmiData)
print(obj)
regimeCoef(obj)
show(obj)
summary(obj)




