library(lineqGPR)


### Name: tmvrnorm.RSM
### Title: '"tmvrnorm"' Sampler for '"RSM"' (Rejection Sampling from the
###   Mode) S3 Class
### Aliases: tmvrnorm.RSM

### ** Examples

n <- 100
x <- seq(0, 1, length = n)
Sigma <- kernCompute(x1 = x, type = "gaussian", par = c(1,0.2))
tmgPar <- list(mu = rep(0,n), Sigma = Sigma + 1e-9*diag(n), lb = rep(-1,n), ub = rep(1,n))
class(tmgPar) <- "RSM"
y <- tmvrnorm(tmgPar, nsim = 10)
matplot(x, y, type = 'l', ylim = c(-1,1),
        main = "Constrained samples using RSM")
abline(h = c(-1,1), lty = 2)




