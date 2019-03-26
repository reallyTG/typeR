library(synRNASeqNet)


### Name: entropyMM
### Title: Miller-Madow corrected Entropy Estimate
### Aliases: entropyMM
### Keywords: entropyMM

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
cellCounts <- table(simData$counts[1, ])
eMM <- entropyMM(cellCounts, unit = "nat")



