library(kergp)


### Name: covRadial
### Title: Creator for the Class '"covRadial"'
### Aliases: covRadial

### ** Examples

set.seed(123)
d <- 2; ng <- 20
xg <- seq(from = 0, to = 1, length.out = ng)
X <- as.matrix(expand.grid(x1 = xg, x2 = xg))

## ============================================================================
## A radial kernel using the power-exponential one-dimensional
## function
## ============================================================================

d <- 2
myCovRadial <- covRadial(k1Fun1 = k1Fun1PowExp, d = 2, cov = "homo", iso = 1)
coef(myCovRadial)
inputNames(myCovRadial) <- colnames(X)
coef(myCovRadial) <- c(alpha = 1.8, theta = 2.0, sigma2 = 4.0)
y <- simulate(myCovRadial, X = X, nsim = 1)
persp(x = xg, y = xg, z = matrix(y, nrow = ng))

## ============================================================================
## Define the inverse multiquadric kernel function. We return the first two
## derivatives and the gradient as attributes of the result.
## ============================================================================

myk1Fun <- function(x, beta = 2) {
    prov <- 1 + x * x
    res <- prov^(-beta)
    der <- matrix(NA, nrow = length(x), ncol = 2)
    der[ , 1] <- - beta * 2 * x * res / prov
    der[ , 2] <- -2 * beta * (1 - (1 + 2 * beta) * x * x) * res / prov / prov
    grad <- -log(prov) * res
    attr(res, "gradient") <- grad
    attr(res, "der") <- der
    res
}

myCovRadial1 <- covRadial(k1Fun1 = myk1Fun, d = 2, cov = "homo", iso = 1)
coef(myCovRadial1)
inputNames(myCovRadial1) <- colnames(X)
coef(myCovRadial1) <- c(beta = 0.2, theta = 0.4, sigma2 = 4.0)
y1 <- simulate(myCovRadial1, X = X, nsim = 1)
persp(x = xg, y = xg, z = matrix(y1, nrow = ng))





