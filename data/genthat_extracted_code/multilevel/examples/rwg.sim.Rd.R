library(multilevel)


### Name: rwg.sim
### Title: Simulate rwg values from a random null distribution
### Aliases: rwg.sim
### Keywords: attribute

### ** Examples

#An example from Dunlap et al. (2003).  The estimate from Dunlap
#et al. Table 2 is 0.53 (p=.05)
RWG.OUT<-rwg.sim(gsize=10,nresp=5,nrep=1000)
summary(RWG.OUT)
quantile(RWG.OUT, c(.95,.99))



