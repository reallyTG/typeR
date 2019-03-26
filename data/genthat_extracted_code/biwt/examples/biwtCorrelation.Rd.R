library(biwt)


### Name: biwtCorrelation
### Title: A function to compute a weighted correlation based on Tukey's
###   biweight
### Aliases: biwtCorrelation biwt.cor
### Keywords: robust multivariate cluster

### ** Examples


samp.data <-t(mvrnorm(30,mu=c(0,0,0),
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



