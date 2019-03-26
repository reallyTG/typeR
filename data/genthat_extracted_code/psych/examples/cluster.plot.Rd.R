library(psych)


### Name: cluster.plot
### Title: Plot factor/cluster loadings and assign items to clusters by
###   their highest loading.
### Aliases: cluster.plot fa.plot factor.plot
### Keywords: multivariate hplot cluster

### ** Examples

circ.data <- circ.sim(24,500)
circ.fa <- fa(circ.data,2)
plot(circ.fa,cut=.5)
f5 <- fa(bfi[1:25],5) 
plot(f5,labels=colnames(bfi)[1:25],show.points=FALSE)
plot(f5,labels=colnames(bfi)[1:25],show.points=FALSE,choose=c(1,2,4))



