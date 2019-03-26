library(meteR)


### Name: plot.meteDist
### Title: Plot METE distributions and associated data
### Aliases: plot.meteDist

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
               abund=arth$count,
               power=arth$mass^(.75),
               minE=min(arth$mass^(.75)))
ipd1 <- ipd(esf1)
plot(ipd1)
plot(ipd1, ptype='rad')



