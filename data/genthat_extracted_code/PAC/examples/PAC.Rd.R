library(PAC)


### Name: PAC
### Title: Partition Assisted Clustering PAC 1) utilizes dsp or bsp-ll to
###   recursively partition the data space and 2) applies a short round of
###   kmeans style postprocessing to efficiently output clustered labels of
###   data points.
### Aliases: PAC

### ** Examples

n = 5e3                       # number of observations
p = 1                         # number of dimensions
K = 3                         # number of clusters
w = rep(1,K)/K                # component weights
mu <- c(0,2,4)                # component means
sd <- rep(1,K)/K              # component standard deviations
g <- sample(1:K,prob=w,size=n,replace=TRUE)   # ground truth for clustering
X <- as.matrix(rnorm(n=n,mean=mu[g],sd=sd[g]))
y <- PAC(X, K)
print(fmeasure(g,y))



