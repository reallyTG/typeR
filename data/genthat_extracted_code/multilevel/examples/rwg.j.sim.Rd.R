library(multilevel)


### Name: rwg.j.sim
### Title: Simulate rwg(j) values from a random null distribution
### Aliases: rwg.j.sim
### Keywords: attribute

### ** Examples

#An example assuming independent items
RWG.J.OUT<-rwg.j.sim(gsize=10,nitems=6,nresp=5,nrep=1000)
summary(RWG.J.OUT)
quantile(RWG.J.OUT, c(.95,.99))

#A more realistic example assuming correlated items.  The 
#estimate in Cohen et al. (2006) is .61.

data(lq2002)
library(MASS)
RWG.J.OUT<-rwg.j.sim(gsize=10,nresp=5,
  itemcors=cor(lq2002[,c("TSIG01","TSIG02","TSIG03")]),
  nrep=1000)
summary(RWG.J.OUT)
quantile(RWG.J.OUT,c(.95,.99))



