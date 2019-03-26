library(synRNASeqNet)


### Name: entropyBayes
### Title: Bayesian Entropy Estimate
### Aliases: entropyBayes
### Keywords: entropyBayes thetaBayes beta_k

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
cellCounts <- table(simData$counts[1, ])
eBJ <- entropyBayes(cellCounts, unit = "nat", priorHyperParam = "Jeffreys")
eBB <- entropyBayes(cellCounts, unit = "nat", priorHyperParam = "BLUnif")
eBP <- entropyBayes(cellCounts, unit = "nat", priorHyperParam = "Perks")
eBM <- entropyBayes(cellCounts, unit = "nat", priorHyperParam = "MiniMax")



