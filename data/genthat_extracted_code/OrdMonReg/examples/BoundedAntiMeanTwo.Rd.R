library(OrdMonReg)


### Name: BoundedAntiMeanTwo, BoundedIsoMeanTwo
### Title: Compute solution to the problem of two ordered isotonic or
###   antitonic curves
### Aliases: BoundedAntiMeanTwo BoundedIsoMeanTwo
### Keywords: regression nonparametric

### ** Examples


## ========================================================
## The first example uses simulated data
## For the analysis of the mechIng dataset see below
## ========================================================

## --------------------------------------------------------
## initialization
## --------------------------------------------------------
set.seed(23041977)
n <- 100
x <- 1:n
g1 <- 1 / x^2 + 2
g1 <- g1 + 3 * rnorm(n)
g2 <- 1 / log(x+3) + 2
g2 <- g2 + 4 * rnorm(n)
w1 <- runif(n)
w1 <- w1 / sum(w1)
w2 <- runif(n)
w2 <- w2 / sum(w2)

## --------------------------------------------------------
## compute estimates
## --------------------------------------------------------
shor <- BoundedAntiMeanTwo(g1, w1, g2, w2, errorPrec = 20, 
    delta = 10^(-10))
    
## corresponding isotonic problem
shor2 <- BoundedIsoMeanTwo(-g2, w2, -g1, w1, errorPrec = 20, 
    delta = 10^(-10))
    
## the following vectors are equal
shor$g1 - -shor2$g2    
shor$g2 - -shor2$g1
        
## --------------------------------------------------------
## for comparison, compute estimates via cyclical projection
## algorithm due to Dykstra (1983) (isotonic problem)
## --------------------------------------------------------
dykstra1 <- BoundedIsoMeanTwoDykstra(-g2, w2, -g1, w1, 
    delta = 10^(-10))

## the following vectors are equal
shor2$g1 - dykstra1$g1
shor2$g2 - dykstra1$g2

## --------------------------------------------------------
## Checking of solution
## --------------------------------------------------------
# This compares the first component of shor$g1 with a^*_1:
c(shor$g1[1], astar_1(g1, w1, g2, w2))

## --------------------------------------------------------
## plot original functions and estimates
## --------------------------------------------------------
par(mfrow = c(1, 1), mar = c(4.5, 4, 3, 0.5))
plot(x, g1, col = 2, main = "Original observations and estimates in problem 
two ordered antitonic regression functions", xlim = c(0, max(x)), ylim = 
range(c(shor$g1, shor$g2, g1, g2)), xlab = expression(x), 
ylab = "measurements and estimates")
points(x, g2, col = 3)
lines(x, shor$g1 + 0.01, col = 2, type = 's', lwd = 2)
lines(x, shor$g2 - 0.01, col = 3, type = 's', lwd = 2)
legend("bottomleft", c(expression("upper estimated function g"[1]*"*"), 
    expression("lower estimated function g"[2]*"*")), lty = 1, col = 2:3, 
    lwd = 2, bty = "n")


## ========================================================
## Analysis of the mechIng dataset
## ========================================================

## --------------------------------------------------------
## input data
## --------------------------------------------------------
data(mechIng)
x <- mechIng$x
n <- length(x)
g1 <- mechIng$g1
g2 <- mechIng$g2
w1 <- rep(1, n)
w2 <- w1

## --------------------------------------------------------
## compute unordered estimates
## --------------------------------------------------------
g1_pava <- BoundedIsoMean(y = g1, w = w1, a = NA, b = NA)
g2_pava <- BoundedIsoMean(y = g2, w = w2, a = NA, b = NA)

## --------------------------------------------------------
## compute estimates via cyclical projection algorithm due to
## Dysktra (1983)
## --------------------------------------------------------
dykstra1 <- BoundedIsoMeanTwoDykstra(g1, w1, g2, w2, 
    delta = 10^-10, output = TRUE)
    
## --------------------------------------------------------
## compute smoothed versions
## --------------------------------------------------------
g1_mon <- dykstra1$g1
g2_mon <- dykstra1$g2   

kernel <- function(x, X, h, Y){
    tmp <- dnorm((x - X) / h) 
    res <- sum(Y * tmp) / sum(tmp)
    return(res)
    }
h <- 0.1 * n^(-1/5)

g1_smooth <- rep(NA, n)
g2_smooth <- g1_smooth
for (i in 1:n){
    g1_smooth[i] <- kernel(x[i], X = x, h, g1_mon)
    g2_smooth[i] <- kernel(x[i], X = x, h, g2_mon)
}
            
## --------------------------------------------------------
## plot original functions and estimates
## --------------------------------------------------------
par(mfrow = c(2, 1), oma = c(0, 0, 2, 0), mar = c(4.5, 4, 2, 0.5), 
    cex.main = 0.8, las = 1) 

plot(0, 0, type = 'n', xlim = c(0, max(x)), ylim = 
    range(c(g1, g2, g1_mon, g2_mon)), xlab = "x", ylab = 
    "measurements and estimates", main = "ordered antitonic estimates")
points(x, g1, col = grey(0.3), pch = 20, cex = 0.8)
points(x, g2, col = grey(0.6), pch = 20, cex = 0.8)
lines(x, g1_mon + 0.1, col = 2, type = 's', lwd = 3)
lines(x, g2_mon - 0.1, col = 3, type = 's', lwd = 3)
legend(0.2, 10, c(expression("upper isotonic function g"[1]*"*"), 
    expression("lower isotonic function g"[2]*"*")), lty = 1, col = 2:3, 
    lwd = 3, bty = "n")

plot(0, 0, type = 'n', xlim = c(0, max(x)), ylim = 
    range(c(g1, g2, g1_mon, g2_mon)), xlab = "x", ylab = "measurements and 
    estimates", main = "smoothed ordered antitonic estimates")
points(x, g1, col = grey(0.3), pch = 20, cex = 0.8)
points(x, g2, col = grey(0.6), pch = 20, cex = 0.8)
lines(x, g1_smooth + 0.1, col = 2, type = 's', lwd = 3)
lines(x, g2_smooth - 0.1, col = 3, type = 's', lwd = 3)
legend(0.2, 10, c(expression("upper isotonic smoothed function "*tilde(g)[1]*"*"), 
    expression("lower isotonic smoothed function "*tilde(g)[2]*"*")), 
    lty = 1, col = 2:3, lwd = 3, bty = "n")

par(cex.main = 1)
title("Original observations and estimates in mechanical engineering example", 
    line = 0, outer = TRUE)



