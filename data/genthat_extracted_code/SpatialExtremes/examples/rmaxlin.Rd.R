library(SpatialExtremes)


### Name: rmaxlin
### Title: Simulation from max-linear models
### Aliases: rmaxlin
### Keywords: distribution

### ** Examples

## A one dimensional simulation from a design matrix. This design matrix
## corresponds to a max-moving average process MMA(alpha)
n.site <- 250
x <- seq(-10, 10, length = n.site)

## Build the design matrix
alpha <- 0.8
dsgn.mat <- matrix(0, n.site, n.site)
dsgn.mat[1,1] <- 1

for (i in 2:n.site){
dsgn.mat[i,1:(i-1)] <- alpha * dsgn.mat[i-1,1:(i-1)]
dsgn.mat[i,i] <- 1 - alpha
}

data <- rmaxlin(3, dsgn.mat = dsgn.mat)
matplot(x, t(log(data)), pch = 1, type = "l", lty = 1, ylab =
expression(log(Y(x))))

## One realisation from the discretized Smith model (2d sim)
x <- y <- seq(-10, 10, length = 100)
data <- rmaxlin(1, cbind(x, y), cov11 = 3, cov12 = 1, cov22 = 4, grid =
TRUE, p = 2000)
image(x, y, log(data), col = heat.colors(64))



