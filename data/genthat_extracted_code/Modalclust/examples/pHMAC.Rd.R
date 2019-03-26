library(Modalclust)


### Name: phmac
### Title: Main function for performing Modal Clusters either parallel or
###   serial mode.
### Aliases: phmac modalclust
### Keywords: cluster, hierarchical, nested, modal

### ** Examples


data(disc2d)
## Not run: disc2d.hmac=phmac(disc2d,npart=1)
## Don't show: 
data(disc2d.hmac)
## End(Don't show)
plot.hmac(disc2d.hmac,level=2)


## For parallel implementation
## Not run: disc2d.hmac.parallel=phmac(disc2d,npart=2,parallel=TRUE)

soft.hmac(disc2d.hmac,level=2)
soft.hmac(disc2d.hmac,n.cluster=3)

hard.hmac(disc2d.hmac,n.cluster=3)



