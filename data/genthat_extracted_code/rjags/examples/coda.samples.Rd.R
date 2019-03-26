library(rjags)


### Name: coda.samples
### Title: Generate posterior samples in mcmc.list format
### Aliases: coda.samples
### Keywords: models

### ** Examples

data(LINE)
LINE$recompile()
LINE.out <- coda.samples(LINE, c("alpha","beta","sigma"), n.iter=1000)
summary(LINE.out)



