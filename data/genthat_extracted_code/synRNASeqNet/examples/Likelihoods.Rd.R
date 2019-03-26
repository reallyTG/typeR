library(synRNASeqNet)


### Name: Likelihoods
### Title: Likelihood Indices
### Aliases: Likelihoods
### Keywords: Likelihoods

### ** Examples

simData <- simulatedData(p = 10, n = 20, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
counts <- simData$counts
adjMat <- simData$adjMat

miML <- parMIEstimate(counts, method = "ML", unit = "nat", nchips = 2)
miML <- aracne.a(miML, eps = 0.5)

valML <- performanceNET(miML, adjMat)
LH <- Likelihoods(valML)



