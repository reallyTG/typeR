library(OrthoPanels)


### Name: opm
### Title: Fitting orthogonal panel models
### Aliases: opm opm.default opm.formula

### ** Examples

set.seed(123)
N <- 5
T <- 2
beta <- .5
rho <- .5
v <- 1

f <- runif(N, -2, 2)
K <- length(beta)
beta <- matrix(beta, K, 1)

## $x_i = 0.75 f + N(0, 1)$:
x <- array(.75*f, dim=c(N, K, (T+1))) + rnorm(N*K*(T+1))

## $y_{i,t} = \rho y_{i,t-1} + \beta x_{i,t} + f_i + N(0,1)$:
y <- matrix(0, N, T+1)
for (t in seq_len(T+1)) {
    yy <- if (t>1) y[,t-1] else 0
    y[,t] <- rho * yy + f  + x[,,t] %*% beta + rnorm(N, sd = sqrt(1/v))
}

d <- data.frame(i = rep(seq(N), T+1),
                t = rep(seq(T+1), each = N),
                as.data.frame(matrix(aperm(x, c(1, 3, 2)), N*(T+1), K,
                                     dimnames = list(NULL, paste0('x', seq(K))))),
                y = c(y))
opm(y~x1, d, n.samp = 10)




