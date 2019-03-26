library(hybridHclust)


### Name: hybridHclust
### Title: Hybrid hierarchical clustering using mutual clusters.
### Aliases: hybridHclust
### Keywords: cluster

### ** Examples

x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
c( -0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
hyb1 <- hybridHclust(x)
par(mfrow=c(1,2))
plot(x, pch = as.character(1:nrow(x)), asp = 1)
plot(hyb1)

# also works 
mc1 <- mutualCluster(x)
mc1
# (3,7) and (1,4) are the two mutual clusters
hyb1 <- hybridHclust(x,mc1)

print('example on sorlie data, may take up to a minute to run')
data(sorlie)
x.scaled <- t(sorlie)
# We take the transpose of "sorlie" because we want to cluster tissue
# samples.  Tissue samples are columns of "sorlie" and hybridHclust will
# cluster rows.

for (i in 1:nrow(x.scaled))
  x.scaled[i,] <- (sorlie[,i]-mean(sorlie[,i]))/sd(sorlie[,i])
# Scale the rows of x.scaled matrix.  This will mean that squared Euclidean
# distance used by hybridHclust will be equivalent to correlation distance.

hhc1 <- hybridHclust(x.scaled,trace=TRUE)
plot(hhc1,labels=dimnames(x.scaled)[[1]])

print('\n\n run demo(hybridHclust) for a more complete package demonstration')



