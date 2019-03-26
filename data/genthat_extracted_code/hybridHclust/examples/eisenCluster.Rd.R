library(hybridHclust)


### Name: eisenCluster
### Title: An implementation of Eisen's hierarchical clustering
### Aliases: eisenCluster
### Keywords: cluster

### ** Examples

set.seed(101)
x <- matrix(rnorm(500),5,100)
x <- rbind(x,x[rep(1,4),]+matrix(rnorm(400),4,100))
x <- rbind(x,x[2:5,]+matrix(rnorm(400),4,100))
par(mfrow=c(1,2))
image(1-cor(t(x)),main='correlation distances',zlim=c(0,2),col=gray(1:100/101))
e1 <- eisenCluster(x,'correlation')
plot(e1)



