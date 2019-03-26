library(deal)


### Name: maketrylist
### Title: Creates the full trylist
### Aliases: maketrylist
### Keywords: models

### ** Examples

data(rats)
rats.nw <- network(rats)
rats.pr <- jointprior(rats.nw,12)
rats.nw <- getnetwork(learn(rats.nw,rats,rats.pr))
rats.tr <- maketrylist(rats.nw,rats,rats.pr)

rats.hi <- getnetwork(heuristic(rats.nw,rats,rats.pr,trylist=rats.tr))



