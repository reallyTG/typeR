library(synRNASeqNet)


### Name: entropyML
### Title: Maximum Likelihood Entropy Estimate
### Aliases: entropyML
### Keywords: entropyML thetaML

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
cellCounts <- table(simData$counts[1, ])
eML <- entropyML(cellCounts, unit = "nat")



