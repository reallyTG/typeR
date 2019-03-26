library(meteR)


### Name: residuals.meteDist
### Title: Compute residuals between METE predictions and data of a
###   meteDist object
### Aliases: residuals.meteDist

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
sad1 <- sad(esf1)
residuals(sad1)



