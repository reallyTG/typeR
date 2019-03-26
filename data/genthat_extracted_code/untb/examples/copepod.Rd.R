library(untb)


### Name: copepod
### Title: Copepod data supplied by Phil Pugh
### Aliases: copepod ostracod
### Keywords: datasets

### ** Examples

data(copepod)
optimize(f=theta.likelihood,interval=c(10,100), maximum=TRUE,
S=no.of.spp(copepod), J=no.of.ind(copepod), give.log=TRUE)

data(ostracod)
preston(ostracod)




