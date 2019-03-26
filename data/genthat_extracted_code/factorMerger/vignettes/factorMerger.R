## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", warning = FALSE, message = FALSE,
                      fig.height = 5, fig.width = 10)

## ------------------------------------------------------------------------
library(factorMerger) 
library(knitr)
library(dplyr)
randSample <- generateMultivariateSample(N = 100, k = 10, d = 3)

## ------------------------------------------------------------------------
fmAll <- mergeFactors(response = randSample$response, factor = randSample$factor)

## ------------------------------------------------------------------------
mergingHistory(fmAll, showStats = TRUE) %>% 
    kable()

## ------------------------------------------------------------------------
fm <- mergeFactors(response = randSample$response, factor = randSample$factor, 
                   method = "fast-fixed")

mergingHistory(fm, showStats = TRUE) %>% 
    kable()

## ------------------------------------------------------------------------
cutTree(fm)

## ------------------------------------------------------------------------
mH <- mergingHistory(fm, T)
thres <- mH$model[nrow(mH) / 2]
cutTree(fm, stat = "loglikelihood", value = thres)

## ------------------------------------------------------------------------
getOptimalPartition(fm)

## ------------------------------------------------------------------------
getOptimalPartitionDf(fm)

## ---- fig.height = 9, fig.width = 18-------------------------------------
plot(fm, panel = "all", nodesSpacing = "equidistant", colorCluster = TRUE)

## ---- fig.height = 5, fig.width = 10-------------------------------------
plot(fmAll, panel = "tree", statistic = "p-value", 
     nodesSpacing = "effects", colorCluster = TRUE)

## ------------------------------------------------------------------------
plot(fm, colorCluster = TRUE, panel = "response")

## ---- fig.height = 5, fig.width = 10-------------------------------------
plot(fm, colorCluster = TRUE, panel = "response", responsePanel = "profile")

## ---- fig.width = 5------------------------------------------------------
plot(fm, panel = "GIC", penalty = 5)

## ------------------------------------------------------------------------
oneDimRandSample <- generateSample(1000, 10)

## ------------------------------------------------------------------------
oneDimFm <- mergeFactors(response = oneDimRandSample$response, factor = oneDimRandSample$factor, 
                         method = "fixed")
mergingHistory(oneDimFm, showStats = TRUE) %>% 
    kable()

## ------------------------------------------------------------------------
plot(oneDimFm, palette = "Reds")

## ------------------------------------------------------------------------
plot(oneDimFm, responsePanel = "boxplot", colorCluster = TRUE)

## ------------------------------------------------------------------------
binomRandSample <- generateSample(1000, 10, distr = "binomial")
table(binomRandSample$response, binomRandSample$factor) %>% 
    kable()

## ------------------------------------------------------------------------
binomFm <- mergeFactors(response = binomRandSample$response, 
                        factor = binomRandSample$factor, 
                        family = "binomial", 
                        method = "fast-adaptive")
mergingHistory(binomFm, showStats = TRUE) %>% 
    kable()

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
plot(binomFm, colorCluster = TRUE, penalty = 7)

## ------------------------------------------------------------------------
plot(binomFm, gicPanelColor = "red")

## ------------------------------------------------------------------------
 library(survival)
 data(veteran)
 survResponse <- Surv(time = veteran$time, 
                  event = veteran$status)
 survivalFm <- mergeFactors(response = survResponse, 
                    factor = veteran$celltype, 
                    family = "survival")

## ------------------------------------------------------------------------
 mergingHistory(survivalFm, showStats = TRUE) %>%
     kable()

## ------------------------------------------------------------------------
 plot(survivalFm)

## ------------------------------------------------------------------------
 plot(survivalFm, nodesSpacing = "effects", colorCluster = TRUE)

