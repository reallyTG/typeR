library(multilevel)


### Name: quantile.agree.sim
### Title: S3 method for class 'agree.sim'
### Aliases: quantile.agree.sim
### Keywords: programming

### ** Examples

#An example from Dunlap et al. (2003).  The estimate from Dunlap et al.
#Table 2 is 0.53
RWG.OUT<-rwg.sim(gsize=10,nresp=5,nrep=1000)
quantile(RWG.OUT, c(.95,.99))



