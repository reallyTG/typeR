library(Modalclust)


### Name: plot.hmac
### Title: Plots of heierarchical tree for a 'hmac' object
### Aliases: plot.hmac plot
### Keywords: cluster, hierarchical, nested, modal

### ** Examples

data(disc2d.hmac)
# disc2d.hmac is the output of phmac(disc2d,npart=1)
plot(disc2d.hmac)

set.seed(20)
mix4=data.frame(rbind(rmvnorm(20,rep(0,4)), rmvnorm(20,rep(2,4)),
               rmvnorm(20,rep(10,4)),rmvnorm(20,rep(13,4))))
mix4.hmac=phmac(mix4,npart=1)
plot(mix4.hmac,col=1:6)

# Verifying with user provided groups
plot(mix4.hmac,userclus=rep(c(1,2,3,4),each=20),col=1:6)




