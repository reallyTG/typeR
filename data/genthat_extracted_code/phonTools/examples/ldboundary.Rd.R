library(phonTools)


### Name: ldboundary
### Title: Linear Discriminant Boundary
### Aliases: ldboundary

### ** Examples


## create two groups with the same covariance patterns
group1 = rmvtnorm (200, means= c(0,0), k=2, sigma = -.4)
group2 = rmvtnorm (200, means= c(3,3), k=2, sigma = -.4)
covariance = (var (group1) + var (group2)) / 2

## plot groups and boundary line between categories.
plot (group1, col = 2, pch = 16, ylim = c(-2,5), xlim = c(-2,5))
points (group2, col = 4, pch = 16)
ldboundary (c(0,0), c(3,3), covariance, add = TRUE)




