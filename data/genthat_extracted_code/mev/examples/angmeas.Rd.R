library(mev)


### Name: angmeas
### Title: Rank-based transformation to angular measure
### Aliases: angmeas

### ** Examples

x <- rmev(n=25, d=3, param=0.5, model="log")
wts <- angmeas(x=x, th=0, Rnorm="l1", Anorm="l1", marg="Frechet", wgt="Empirical")
wts2 <- angmeas(x=x, Rnorm="l2", Anorm="l2", marg="Pareto", th=0)



