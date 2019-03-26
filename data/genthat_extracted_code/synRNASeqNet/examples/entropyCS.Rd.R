library(synRNASeqNet)


### Name: entropyCS
### Title: Chao-Shen Entropy Estimate
### Aliases: entropyCS
### Keywords: entropyCS thetaGT

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
cellCounts <- table(simData$counts[1, ])
eCS <- entropyCS(cellCounts, unit = "nat")



