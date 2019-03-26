library(synRNASeqNet)


### Name: parMIEstimate
### Title: Parallel Mutual Information Estimation
### Aliases: parMIEstimate
### Keywords: parMIEstimate

### ** Examples

simData <- simulatedData(p = 5, n = 10, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
counts <- simData$counts
adjMat <- simData$adjMat

miML <- parMIEstimate(counts, method = "ML", unit = "nat", nchips = 2)
miBJ <- parMIEstimate(counts, method = "Bayes", unit = "nat",
                      nchips = 2, priorHyperParam = "Jeffreys")
miSH <- parMIEstimate(counts, method = "Shrink", unit = "nat",
                      nchips = 2)
miKD <- parMIEstimate(counts, method = "KD", nchips = 2)
miKNN <- parMIEstimate(counts, method = "KNN", unit = "nat", k = 3,
                      nchips = 2)



