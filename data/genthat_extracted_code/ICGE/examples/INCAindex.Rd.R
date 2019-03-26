library(ICGE)


### Name: INCAindex
### Title: INCA index
### Aliases: INCAindex print.incaix summary.incaix plot.incaix
### Keywords: multivariate cluster

### ** Examples

#generate 3 clusters, each of them with 20 objects in dimension 5.
mu1 <- sample(1:10, 5, replace=TRUE)
x1 <- matrix(rnorm(20*5, mean = mu1, sd = 1),ncol=5, byrow=TRUE)
mu2 <- sample(1:10, 5, replace=TRUE)
x2 <- matrix(rnorm(20*5, mean = mu2, sd = 1),ncol=5, byrow=TRUE)
mu3 <- sample(1:10, 5, replace=TRUE)
x3 <- matrix(rnorm(20*5, mean = mu3, sd = 1),ncol=5, byrow=TRUE)
x <- rbind(x1,x2,x3)

# Euclidean distance between units.
d <- dist(x)

# given the right partition, calculate the percentage of well classified objects.
partition <- c(rep(1,20), rep(2,20), rep(3,20))
INCAindex(d, partition)


# In order to estimate the number of cluster in data, try several 
#  partitions and compare the results
library(cluster)
T <- rep(NA, 5)
for (l in 2:5){
	part <- pam(d,l)$clustering
	T[l] <- INCAindex(d,part)$Total
}

plot(T, type="b",xlab="Number of clusters", ylab="INCA", xlim=c(1.5, 5.5))



