library(Modalclust)


### Name: choose.cluster
### Title: Choosing the cluster which is closest to a specified point
### Aliases: choose.cluster
### Keywords: cluster, hierarchical, nested, modal

### ** Examples

data(disc2d.hmac)
#disc2d.hmac is the output of phmac(disc2d,npart=1)

choose.cluster(disc2d.hmac,x=c(0,0),level=3)
choose.cluster(disc2d.hmac,x=c(0,0),n.cluster=2)

# Users can choose anypoint they want by clicking the point 
# in the plot after the following command. 
# choose.cluster(disc2d.hmac,level=3)



