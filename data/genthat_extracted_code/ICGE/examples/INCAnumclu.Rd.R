library(ICGE)


### Name: INCAnumclu
### Title: Estimation of Number of Clusters in Data
### Aliases: INCAnumclu plot.incanc print.incanc
### Keywords: multivariate cluster

### ** Examples

#------- Example 1 --------------------------------------
#generate 3 clusters, each of them with 20 objects in dimension 5.
mu1 <- sample(1:10, 5, replace=TRUE)
x1 <- matrix(rnorm(20*5, mean = mu1, sd = 1),ncol=5, byrow=TRUE)
mu2 <- sample(1:10, 5, replace=TRUE)
x2 <- matrix(rnorm(20*5, mean = mu2, sd = 1),ncol=5, byrow=TRUE)
mu3 <- sample(1:10, 5, replace=TRUE)
x3 <- matrix(rnorm(20*5, mean = mu3, sd = 1),ncol=5, byrow=TRUE)
x <- rbind(x1,x2,x3)

# calculte euclidean distance between them
d <- dist(x)

# calculate the INCA index associated to partitions with k=2, ..., k=5 clusters.
INCAnumclu(d, K=5)
out <- INCAnumclu(d, K=5)
plot(out)

#------- Example 1 cont. --------------------------------
# With hypothetical noise elements
noiseunits <- rep(FALSE, 60)
noiseunits[sample(1:60, 20)] <- TRUE
out <- INCAnumclu(d, K=5, L="custom", noise=noiseunits)
plot(out)



