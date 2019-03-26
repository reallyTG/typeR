library(mev)


### Name: angmeasdir
### Title: Dirichlet mixture model for the spectral density
### Aliases: angmeasdir

### ** Examples

set.seed(123)
x <- rmev(n=250, d=2, param=0.5, model="log")
out <- angmeasdir(x=x, th=0, Rnorm="l1", Anorm="l1", marg="Frechet", wgt="Empirical")



