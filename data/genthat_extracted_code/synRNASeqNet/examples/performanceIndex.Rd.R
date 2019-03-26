library(synRNASeqNet)


### Name: performanceIndex
### Title: Evalutate Performance Indices
### Aliases: performanceIndex
### Keywords: performanceIndex

### ** Examples

simData <- simulatedData(p = 10, n = 20, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
counts <- simData$counts
adjMat <- simData$adjMat

miML <- parMIEstimate(counts, method = "ML", unit = "nat", nchips = 2)
valML <- performanceIndex(miML, adjMat)



