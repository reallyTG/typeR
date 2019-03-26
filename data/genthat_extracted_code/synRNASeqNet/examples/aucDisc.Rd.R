library(synRNASeqNet)


### Name: aucDisc
### Title: Calculate Area Under a (ROC/PR) Curve
### Aliases: aucDisc
### Keywords: aucDisc

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
counts <- simData$counts
adjMat <- simData$adjMat

miML <- parMIEstimate(counts, method = "ML", unit = "nat", nchips = 2)
valML <- performanceIndex(miML, adjMat)

AUROC <- aucDisc(valML[, "FPR"], valML[, "Recall"])
AUPR <- aucDisc(valML[, "Recall"], valML[, "Precision"])



