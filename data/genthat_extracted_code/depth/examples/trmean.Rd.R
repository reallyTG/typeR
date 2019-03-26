library(depth)


### Name: trmean
### Title: Classical-like depth-based trimmed mean
### Aliases: trmean
### Keywords: multivariate nonparametric robust

### ** Examples

## exact trimmed mean with default constant weight function
data(starsCYG, package = "robustbase")
trmean(starsCYG, .1)

## another example with default constant weight function
set.seed(159); library(MASS)
mu1 <- c(0,0); mu2 <- c(6,0); sigma <- matrix(c(1,0,0,1), nc = 2)
mixbivnorm <- rbind(mvrnorm(80, mu1, sigma), mvrnorm(20, mu2, sigma))
trmean(mixbivnorm, 0.3)

## trimmed mean with a non constant weight function
W1 <-function(x,alpha,epsilon) {
  (2*(x-alpha)^2/epsilon^2)*(alpha<=x)*(x<alpha+epsilon/2)+
  (-2*(x-alpha)^2/epsilon^2+4*(x-alpha)/epsilon-1)*
  (alpha+epsilon/2<=x)*(x<alpha+epsilon)+(alpha+epsilon<=x)
}
set.seed(345)
x <- matrix(rnorm(210), nc = 3)
trmean(x, .1, W = W1, epsilon = .05)

## two other examples of weighted trimmed mean
set.seed(345)
x <- matrix(rnorm(210), nc = 3)
W2 <- function(x, alpha) {x^(.25)}
trmean(x, .1, W = W2)
W3 <- function(x, alpha, beta){1-sqrt(x)+x^2/beta}
trmean(x, .1, W = W3, beta = 1)



