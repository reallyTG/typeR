library(synRNASeqNet)


### Name: entropyShrink
### Title: James-Stein Shrinkage Entropy Estimate
### Aliases: entropyShrink
### Keywords: entropyShrink thetaShrink shrinkageIntensity

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
cellCounts <- table(simData$counts[1, ])
eShrink <- entropyShrink(cellCounts, unit = "nat", shrinkageTarget = NULL)



