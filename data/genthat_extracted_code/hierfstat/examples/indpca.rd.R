library(hierfstat)


### Name: indpca
### Title: PCA on a matrix of individuals genotypes frequencies
### Aliases: indpca print.indpca plot.indpca
### Keywords: multivariate

### ** Examples

##not run
data(gtrunchier)
x<-indpca(gtrunchier[,-2],ind.labels=gtrunchier[,2])
plot(x,col=gtrunchier[,1],cex=0.7)



