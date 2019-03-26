library(detpack)


### Name: det.leafs
### Title: Extract Leaf Elements from Distribution Element Tree
### Aliases: det.leafs

### ** Examples

require(stats); require(graphics)
# generate DET based on bi-variate Gaussian data
n <- 1e4; x <- rnorm(n)
x <- matrix(c(x, x+rnorm(n,0,0.2)), nrow = 2, byrow = TRUE)
det <- det.construct(x)
# plot data and element pattern
leafs <- det.leafs(det)
plot(t(x), type = "p", pch = ".", asp = 1)
for (k in 1:length(leafs$p)) {
   p <- leafs$lb[,k] # element corner point
   w <- leafs$size[,k] # element size
   elem <- rbind(c(p[1],p[1]+w[1],p[1]+w[1],p[1],p[1]),
                 c(p[2],p[2],p[2]+w[2],p[2]+w[2],p[2])) # element rectangle
   elem <- t(det$A) %*% elem + det$mu %*% t(rep(1,5)) # pre-white transform
   lines(elem[1,],elem[2,]) # draw element
}



