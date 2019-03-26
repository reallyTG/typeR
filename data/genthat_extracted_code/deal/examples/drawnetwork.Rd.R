library(deal)


### Name: drawnetwork
### Title: Graphical interface for editing networks
### Aliases: drawnetwork
### Keywords: models

### ** Examples

data(rats)
rats.nw    <- network(rats)
rats.prior <- jointprior(rats.nw,12)
rats.nw    <- getnetwork(learn(rats.nw,rats,rats.prior))

## Not run: newrat  <- getnetwork(drawnetwork(rats.nw,rats,rats.prior))



