library(meteR)


### Name: mseZ
### Title: Compute z-score of mean squared error
### Aliases: mseZ mseZ.meteDist

### ** Examples

esf1=meteESF(spp=arth$spp,
              abund=arth$count,
              power=arth$mass^(4/3),
              minE=min(arth$mass^(4/3)))
sad1=sad(esf1)
mseZ(sad1, nrep=100, type='rank',return.sim=TRUE)



