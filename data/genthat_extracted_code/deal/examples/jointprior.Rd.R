library(deal)


### Name: jointprior
### Title: Calculates the joint prior distribution
### Aliases: jointprior
### Keywords: models

### ** Examples

data(rats)
rats.nw    <- network(rats)
rats.prior <- jointprior(rats.nw,12)

## Not run: savenet(rats.nw,file("rats.net"))
## Not run: rats.nw <- readnet(file("rats.net"))
## Not run: rats.nw <- prob(rats.nw,rats)
## Not run: rats.prior <- jointprior(rats.nw,12)




