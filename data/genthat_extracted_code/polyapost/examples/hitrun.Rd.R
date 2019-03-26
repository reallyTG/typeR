library(polyapost)


### Name: hitrun
### Title: Hit and Run Algorithm for Constrained Dirichlet Distribution
### Aliases: hitrun hitrun.default hitrun.hitrun
### Keywords: misc

### ** Examples

# Bayesian inference for discrete probability distribution on {1, ..., d}
# state is probability vector p of length d
d <- 10
x <- 1:d
# equality constraints
#     mean equal to (d + 1) / 2, that is, sum(x * p) = (d + 1) / 2
# inequality constraints
#     median less than or equal to (d + 1) / 2, that is,
#         sum(p[x <= (d + 1) / 2]) <= 1 / 2
a2 <- rbind(x)
b2 <- (d + 1) / 2
a1 <- rbind(as.numeric(x <= (d + 1) / 2))
b1 <- 1 / 2
# simulate prior, which Dirichlet(alpha)
# posterior would be another Dirichlet with n + alpha - 1,
#    where n is count of IID data for each value
alpha <- rep(2.3, d)
out <- hitrun(alpha, nbatch = 30, blen = 250,
    a1 = a1, b1 = b1, a2 = a2, b2 = b2)
# prior means
round(colMeans(out$batch), 3)
# Monte Carlo standard errors
round(apply(out$batch, 2, sd) / sqrt(out$nbatch), 3)



