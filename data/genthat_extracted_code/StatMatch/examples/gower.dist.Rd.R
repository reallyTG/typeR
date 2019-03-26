library(StatMatch)


### Name: gower.dist
### Title: Computes the Gower's Distance
### Aliases: gower.dist
### Keywords: multivariate cluster

### ** Examples


x1 <- as.logical(rbinom(10,1,0.5)) 
x2 <- sample(letters, 10, replace=TRUE)
x3 <- rnorm(10)
x4 <- ordered(cut(x3, -4:4, include.lowest=TRUE))
xx <- data.frame(x1, x2, x3, x4, stringsAsFactors = FALSE)

# matrix of distances among observations in xx
dx <- gower.dist(xx)
head(dx)

# matrix of distances among first obs. in xx
# and the remaining ones
gower.dist(data.x=xx[1:6,], data.y=xx[7:10,])




