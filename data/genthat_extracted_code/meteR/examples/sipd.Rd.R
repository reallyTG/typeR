library(meteR)


### Name: sipd
### Title: Generic method to obtain the species-level individual power
###   distribution (SIPD)
### Aliases: sipd sipd.meteESF

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
sipd1 <- sipd(esf1, sppID=5)
sipd1



