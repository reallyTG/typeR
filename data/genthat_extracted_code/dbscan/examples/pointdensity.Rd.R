library(dbscan)


### Name: pointdensity
### Title: Calculate Local Density at Each Data Point
### Aliases: pointdensity density
### Keywords: model

### ** Examples

set.seed(665544)
n <- 100
x <- cbind(
  x=runif(10, 0, 5) + rnorm(n, sd=0.4),
  y=runif(10, 0, 5) + rnorm(n, sd=0.4)
  )
plot(x)

### calculate density
d <- pointdensity(x, eps = .5, type = "density")

### density distribution
summary(d)
hist(d, breaks = 10)

### point size is proportional to Density
plot(x, pch = 19, main = "Density (eps = .5)", cex = d*5)

### Wishart (1969) single link clustering method
# 1. remove noise with low density
f <- pointdensity(x, eps = .5, type = "frequency")
x_nonoise <- x[f >= 5,]

# 2. use single-linkage on the non-noise points
hc <- hclust(dist(x_nonoise), method = "single")
plot(x, pch = 19, cex = .5)
points(x_nonoise, pch = 19, col= cutree(hc, k = 4)+1L)



