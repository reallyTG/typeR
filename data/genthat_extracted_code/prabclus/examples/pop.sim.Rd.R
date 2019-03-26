library(prabclus)


### Name: pop.sim
### Title: p-value simulation for presence-absence matrices clustering test
### Aliases: pop.sim
### Keywords: cluster htest

### ** Examples

options(digits=4)
data(kykladspecreg)
data(nb)
set.seed(1234)
pop.sim(t(kykladspecreg), nb, times=5, h0c=0.35, teststat="nn", testc=3)



