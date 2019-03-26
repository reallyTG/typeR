library(Modalclust)


### Name: hard.hmac
### Title: Plot clusters with different colors.
### Aliases: hard.hmac
### Keywords: cluster, hierarchical, nested, modal

### ** Examples

data(disc2d.hmac)
#disc2d.hmac is the output of phmac(disc2d,npart=1)

hard.hmac(disc2d.hmac,level=3)

#returns the membership of each observation
disc2d.2clus=hard.hmac(hmacobj=disc2d.hmac,n.cluster=2,plot=FALSE)
table(disc2d.2clus)

#hard.hmac(disc2d.hmac)

iris.hmac=phmac(iris[,-5])
# For more than two dimensions it produces the pairs plot
hard.hmac(iris.hmac,n.cluster=2)

 



