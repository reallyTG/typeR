library(meteR)


### Name: print.meteDist
### Title: Print summaries of 'meteDist' objects
### Aliases: print.meteDist

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
ipd1 <- ipd(esf1)
ipd1



