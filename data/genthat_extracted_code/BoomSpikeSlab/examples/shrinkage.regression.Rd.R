library(BoomSpikeSlab)


### Name: shrinkage.regression
### Title: Shrinking Regression Coefficients
### Aliases: ShrinkageRegression CoefficientGroup

### ** Examples

b0 <- -1
b1 <- rnorm(20, 3, .2)
b2 <- rnorm(30, -4, 7)
nobs <- 10000
beta <- c(b0, b1, b2)

X <- cbind(1, matrix(rnorm(nobs * (length(beta) - 1)), nrow = nobs, ncol = length(beta) - 1))
y.hat <- X %*% beta
y <- rnorm(nobs, y.hat, .5)

groups <- list(intercept = CoefficientGroup(1, prior = NormalPrior(0, 100)),
               first = CoefficientGroup(2:21,
                                        mean.hyperprior = NormalPrior(0, 100),
                                        sd.hyperprior = SdPrior(.2, 1)),
               second = CoefficientGroup(22:51,
                                         mean.hyperprior = NormalPrior(0, 100),
                                         sd.hyperprior = SdPrior(7, 1)))

model <- ShrinkageRegression(y, X, groups,
                             residual.precision.prior = SdPrior(.5, 1),
                             niter = 1000)




