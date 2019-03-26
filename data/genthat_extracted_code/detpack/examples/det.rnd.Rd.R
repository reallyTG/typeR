library(detpack)


### Name: det.rnd
### Title: Bootstrapping from Distribution Element Trees
### Aliases: det.rnd

### ** Examples

## 2d example
require(stats); require(graphics)
# data from uniform distribution on a wedge
x <- matrix(runif(2e4), ncol = 2); x <- x[x[,2]<x[,1],]
x2c <- 0.75 # conditioning component
# data and conditioning line
split.screen(c(2, 1)); screen(1)
plot(x, type = "p", pch = ".", asp = 1)
lines(c(0,1), x2c*c(1,1), col = "red")
# DET construction and bootstrapping
det <- det.construct(t(x), mode = 1, lb = 0, ub = 0) # const. de's, no pre-white
y <- det.rnd(1e3, det, xc = x2c, dc = 2, cores = 2) # conditional bootstrap'g
# compare generated data (black) with exact cond. distribution (red)
screen(2); det1(y[1,], mode = 1)
lines(c(0,x2c,x2c,1,1),c(0,0,1/(1-x2c),1/(1-x2c),0), col = "red")

## example 2d unconditional
require(stats); require(graphics)
x <- matrix(runif(2e4), ncol = 2); x <- x[x[,2]<x[,1],] # uniform wedge
det <- det.construct(t(x), mode = 1, lb = 0, ub = 0) # no pre-white
y <- t(det.rnd(nrow(x), det, cores = 2)) # smooth bootstrapping
split.screen(c(2, 1))
screen(1); plot(x, type = "p", pch = ".", asp = 1, main = "original")
screen(2); plot(y, type = "p", pch = ".", asp = 1, main = "bootstrapped")

## example 3d
require(stats); require(graphics)
# mean and covariance of Gaussian, data generation
mu <- c(1,3,2); C <- matrix(c(25,7.5,1.75,7.5,7,1.35,1.75,1.35,0.43), nrow = 3)
A <- eigen(C); B <- diag(A$values); A <- A$vectors
x <- matrix(rnorm(3e4), nrow = 3)
x <- A %*% (sqrt(B) %*% x) + mu %*% t(rep(1,ncol(x)))
lbl <- "x1 | x2 = 7 & x3 = 2.5"
pairs(t(x), labels = c("x1","x2","x3"), pch = ".", main = lbl)
# bootstrapping conditional on x2 and x3
det <- det.construct(x, lb = 0, ub = 0)
xc <- c(2.5,7); d <- c(3,2) # conditional on x2 = 7 & x3 = 2.5
y <- det.rnd(1e4, det, xc, d, cores = 1)
det1(y[1,], mode = 1, main = lbl)
# compare with exact conditional density
Cm1 <- solve(C); var1 <- det(C)/det(C[2:3,2:3]) # conditional variance
mu1 <- mu[1] + var1*((mu[2]-xc[d==2])*Cm1[1,2]+(mu[3]-xc[d==3])*Cm1[1,3]) # cond. mean
x1 <- mu1 + seq(-50,50)/50 * 5*sqrt(var1) # x1-axis grid points
lines(x1, dnorm(x1,mu1,sqrt(var1)), col = "red")



