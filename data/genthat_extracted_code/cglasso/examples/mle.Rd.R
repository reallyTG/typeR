library(cglasso)


### Name: mle
### Title: Maximum Likelihood Estimation
### Aliases: mle mle.glasso mle.mglasso mle.cglasso
### Keywords: multivariate models graphs

### ** Examples

library("cglasso")
set.seed(123)

#################
# cglasso model #
#################
n <- 100L
p <- 5L
mu <- rep.int(0L, times = p)
X <- rdatacggm(n = n, mu = mu, probr = 0.05)
out <- cglasso(X = X)
out_mle <- mle(out)
out_mle

inherits(out_mle, "cglasso")
class(out_mle)

# inheriting method functions from 'cglasso': some examples
coef(out_mle, nrho = 10L, print.info = TRUE)
to_graph(out_mle, nrho = 10L, weighted = TRUE)
out_aic <- aic(out_mle)
out_aic
plot(out_mle, typeplot = "graph", gof = out_aic)

#################
# mglasso model #
#################
R <- event(X)
X <- as.matrix(X)
X[R == 1L] <- NA
out <- mglasso(X = X)
out_mle <- mle(out)
out_mle

inherits(out_mle, "mglasso")
class(out_mle)

# inheriting method functions from 'mglasso': some examples
coef(out_mle, nrho = 10L, print.info = TRUE)
to_graph(out_mle, nrho = 10L, weighted = TRUE)
out_aic <- aic(out_mle)
out_aic
plot(out_mle, typeplot = "graph", gof = out_aic)

################
# glasso model #
################
X <- MASS::mvrnorm(n = n, mu = mu, Sigma = diag(p))
out <- glasso(X)
out_mle <- mle(out)
out_mle

inherits(out_mle, "glasso")
class(out_mle)

# inheriting method functions from 'glasso': some examples
coef(out_mle, nrho = 10L, print.info = TRUE)
to_graph(out_mle, nrho = 10L, weighted = TRUE)
out_aic <- aic(out_mle)
out_aic
plot(out_mle, typeplot = "graph", gof = out_aic)



