library(synRNASeqNet)


### Name: parMIKD
### Title: Parallel Kernel Density Mutual Information Estimate
### Aliases: parMIKD
### Keywords: parMIKD

### ** Examples

simData <- simulatedData(p = 10, n = 50, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
counts <- simData$counts
adjMat <- simData$adjMat

miKD <- parMIEstimate(counts, method = "KD", nchips = 2)



