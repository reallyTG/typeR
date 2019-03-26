library(polycor)


### Name: hetcor
### Title: Heterogeneous Correlation Matrix
### Aliases: hetcor hetcor.default hetcor.data.frame print.hetcor
###   as.matrix.hetcor
### Keywords: models

### ** Examples

if(require(mvtnorm)){
    set.seed(12345)
    R <- matrix(0, 4, 4)
    R[upper.tri(R)] <- runif(6)
    diag(R) <- 1
    R <- cov2cor(t(R) %*% R)
    round(R, 4)  # population correlations
    data <- rmvnorm(1000, rep(0, 4), R)
    round(cor(data), 4)   # sample correlations
    }
if(require(mvtnorm)){
    x1 <- data[,1]
    x2 <- data[,2]
    y1 <- cut(data[,3], c(-Inf, .75, Inf))
    y2 <- cut(data[,4], c(-Inf, -1, .5, 1.5, Inf))
    data <- data.frame(x1, x2, y1, y2)
    hetcor(data)  # Pearson, polychoric, and polyserial correlations, 2-step est.
    }
if(require(mvtnorm)){
    hetcor(x1, x2, y1, y2, ML=TRUE) # Pearson, polychoric, polyserial correlations, ML est.
    }



