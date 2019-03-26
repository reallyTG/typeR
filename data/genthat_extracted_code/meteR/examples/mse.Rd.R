library(meteR)


### Name: mse
### Title: Computes mean squared error for rank or cdf
### Aliases: mse mse.meteDist

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
sad1 <- sad(esf1)
mse(sad1, type='rank', relative=FALSE)
ebar1 <- ebar(esf1)
mse(ebar1)



