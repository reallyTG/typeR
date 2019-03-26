library(synRNASeqNet)


### Name: simulatedData
### Title: Random Generation Networks for RNA-Seq Data
### Aliases: simulatedData
### Keywords: simulatedData

### ** Examples

simData <- simulatedData(p = 50, n = 100, mu = 100, sigma = 0.25,
                        ppower = 0.73, noise = FALSE)
plot(simData$graph)

counts <- simData$counts
adjMat <- simData$adjMat



