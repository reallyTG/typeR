library(s2dverification)


### Name: Cluster
### Title: K-means Clustering.
### Aliases: Cluster
### Keywords: datagen

### ** Examples

# Generating synthetic data
a1 <- array(dim = c(200, 4))
mean1 <- 0
sd1 <- 0.3 

c0 <- seq(1, 200)
c1 <- sort(sample(x = 1:200, size = sample(x = 50:150, size = 1), replace = FALSE))
x1 <- c(1, 1, 1, 1)
for (i1 in c1) {
  a1[i1, ] <- x1 + rnorm(4, mean = mean1, sd = sd1)
}

c1p5 <- c0[!(c0 %in% c1)]
c2 <- c1p5[seq(1, length(c1p5), 2)] 
x2 <- c(2, 2, 4, 4)
for (i2 in c2) {
  a1[i2, ] <- x2 + rnorm(4, mean = mean1, sd = sd1)
}

c3 <- c1p5[seq(2, length(c1p5), 2)]
x3 <- c(3, 3, 1, 1)
for (i3 in c3) {
  a1[i3, ] <- x3 + rnorm(4, mean = mean1, sd = sd1)
}

# Computing the clusters
res1 <- Cluster(var = a1, weights = array(1, dim = dim(a1)[2]), nclusters = 3)
print(res1$cluster)
print(res1$centers)

res2 <- Cluster(var = a1, weights = array(1, dim = dim(a1)[2]))
print(res2$cluster)
print(res2$centers)



