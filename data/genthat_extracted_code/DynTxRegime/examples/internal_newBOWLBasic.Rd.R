library(DynTxRegime)


### Name: .newBOWLBasic
### Title: Backward Outcome Weighted Learning With Binary Treatment.
### Aliases: .newBOWLBasic .newBOWLBasic,formula,txInfoNoSubsets-method
###   .newBOWLBasic,formula,txInfoWithSubsets-method
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

obj <- DynTxRegime:::.newBOWLBasic(regime = regime,
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


obj <- DynTxRegime:::.newBOWLBasic(regime = regime,
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
                         list("subset2", c("CD")))
          txOpts <- character(nrow(data))
          txOpts[data$A1 == "CD"] <- "subset1"
          txOpts[data$A1 == "MR"] <- "subset2"

          return(list("subsets" = subsets, "txOpts" = txOpts))
        }

df <- bmiData
df$A2[df$A1 == "MR"] <- "CD"

txInfo <- DynTxRegime:::.newTxInfo(fSet = fSet, txName = "A2", data = df, 
                                   suppress = TRUE, verify = TRUE)

obj <- DynTxRegime:::.newBOWLBasic(regime = regime,
                                    txInfo = txInfo,
                                    ind = !logical(nrow(df)),
                                    prWgt = prWgt,
                                    response = y,
                                    txVec = txVec,
                                    data = df,
                                    kernel = "linear",
                                    kparam = NULL,
                                    lambdas = 0.1,
                                    cvFolds = 0L,
                                    suppress = TRUE)

is(obj)
cvInfo(obj)
optimObj(obj)
DynTxRegime:::.predictOptimalTx(obj)
DynTxRegime:::.predictOptimalTx(obj,df)
print(obj)
regimeCoef(obj)
show(obj)
summary(obj)


obj <- DynTxRegime:::.newBOWLBasic(regime = regime,
                                   txInfo = txInfo,
                                   ind = !logical(nrow(df)),
                                   prWgt = prWgt,
                                   response = y,
                                   txVec = txVec,
                                   data = df,
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



