library(biwt)


### Name: biwt-package
### Title: A package to compute the biweight mean vector and covariance &
###   correlation matrices
### Aliases: biwt-package biwt
### Keywords: robust multivariate cluster

### ** Examples


### To calculate the multivariate location vector and scale matrix:

samp.data <- t(mvrnorm(30,mu=c(0,0),Sigma=matrix(c(1,.75,.75,1),ncol=2)))

samp.bw <- biwt.est(samp.data)
samp.bw

samp.bw.var1 <- samp.bw$biwt.sig[1,1]
samp.bw.var2 <- samp.bw$biwt.sig[2,2]
samp.bw.cov <- samp.bw$biwt.sig[1,2]

samp.bw.cor <- samp.bw$biwt.sig[1,2] / 
	sqrt(samp.bw$biwt.sig[1,1]*samp.bw$biwt.sig[2,2])
samp.bw.cor


### To calculate the correlation(s):


samp.data <- t(mvrnorm(30,mu=c(0,0,0),
	Sigma=matrix(c(1,.75,-.75,.75,1,-.75,-.75,-.75,1),ncol=3)))

# To compute the 3 pairwise correlations from the sample data:

samp.bw.cor <- biwt.cor(samp.data, output="vector")
samp.bw.cor

# To compute the 3 pairwise correlations in matrix form:

samp.bw.cor.mat <- biwt.cor(samp.data)
samp.bw.cor.mat

# To compute the 3 pairwise distances in matrix form:

samp.bw.dist.mat <- biwt.cor(samp.data, output="distance")
samp.bw.dist.mat

# To convert the distances into an object of class `dist'

as.dist(samp.bw.dist.mat)




