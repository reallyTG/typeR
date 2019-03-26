library(clustvarsel)


### Name: clustvarsel
### Title: Variable Selection for Gaussian Model-Based Clustering
### Aliases: clustvarsel print.clustvarsel
### Keywords: cluster

### ** Examples

# Simulate data with 2 clusters in the first two variables and no 
# clustering in the rest. Clusters have mixing proportion pro, means 
# mu1 and mu2 and variances sigma1 and sigma2
require(MASS)
n <- 200
pro <- 0.5
mu1 <- c(0,0)
mu2 <- c(3,3)
sigma1 <- matrix(c(1,0.5,0.5,1),2,2,byrow=TRUE)
sigma2 <- matrix(c(1.5,-0.7,-0.7,1.5),2,2,byrow=TRUE)
X <- matrix(0, n, 5)
colnames(X) <- paste("X", 1:ncol(X), sep ="")
# generate the clustering variables
u <- runif(n)
Class <- ifelse(u < pro, 1, 2)
X[u < pro, 1:2]  <- mvrnorm(sum(u < pro), mu = mu1, Sigma = sigma1)
X[u >= pro, 1:2] <- mvrnorm(sum(u >= pro), mu = mu2, Sigma = sigma2)
# generate the non-clustering variables
X[,3] <- X[,1] + rnorm(n)
X[,4] <- rnorm(n, mean = 1.5, sd = 2)
X[,5] <- rnorm(n, mean = 2, sd = 1)
# plot the data
clPairs(X, Class, gap = 0)

# sequential forward greedy search (default)
out <- clustvarsel(X, G = 1:5)
out
summary(out$model)
table(Class, out$mod$classification)

## Not run: 
##D # sequential backward greedy search
##D clustvarsel(X, G = 1:5, direction = "backward")
##D 
##D # sequential backward greedy search with subsampling at hierarchical 
##D # intialisation stage
##D clustvarsel(X, G = 1:5, direction = "backward", 
##D             samp = TRUE, sampsize = 50)
##D 
##D # parallel backward greedy search 
##D clustvarsel(X, G = 1:5, direction = "backward", parallel = TRUE)
##D 
##D # headlong search 
##D clustvarsel(X, G = 1:5, search = "headlong")
## End(Not run)



