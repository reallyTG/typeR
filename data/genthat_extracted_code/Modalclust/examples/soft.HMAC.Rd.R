library(Modalclust)


### Name: soft.hmac
### Title: Plot soft clusters from Modal Clustering output
### Aliases: soft.hmac
### Keywords: cluster, hierarchical, nested, modal

### ** Examples

data(logcta20.hmac)
#logcta20.hmac is the output of phmac(logcta20,npart=1)

soft.hmac(logcta20.hmac,n.cluster=3)

#return the posterior probability of each observation and boundary points.
postprob=soft.hmac(hmacobj=logcta20.hmac,n.cluster=3,plot=FALSE) 



