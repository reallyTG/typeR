library(markovchain)


### Name: markovchainListFit
### Title: markovchainListFit
### Aliases: markovchainListFit

### ** Examples


# using holson dataset
data(holson)
# fitting a single markovchain
singleMc <- markovchainFit(data = holson[,2:12])
# fitting a markovchainList
mclistFit <- markovchainListFit(data = holson[, 2:12], name = "holsonMcList")



