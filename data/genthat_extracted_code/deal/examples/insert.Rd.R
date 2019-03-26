library(deal)


### Name: insert
### Title: Insert/remove an arrow in network
### Aliases: insert remover
### Keywords: iplot

### ** Examples

data(rats)
rats.nw    <- network(rats)
rats.nw    <- getnetwork(insert(rats.nw,2,1,nocalc=TRUE))
rats.prior <- jointprior(rats.nw,12)

rats.nw2   <- network(rats)
rats.nw2   <- getnetwork(learn(rats.nw2,rats,rats.prior))
rats.nw2   <- getnetwork(insert(rats.nw2,1,2,rats,rats.prior))

rats.nw3   <- getnetwork(remover(rats.nw2,1,2,rats,rats.prior))



