library(DCG)


### Name: temperatureSample
### Title: generate temperatures 'temperatureSample' generate tempatures
###   based on either random or fixed intervals
### Aliases: temperatureSample

### ** Examples

symmetricMatrix <- as.symmetricAdjacencyMatrix(monkeyGrooming, weighted = TRUE, rule = "weak")
Sim <- as.SimilarityMatrix(symmetricMatrix)
temperatures <- temperatureSample(start = 0.01, end = 20, n = 20, method = 'random')



