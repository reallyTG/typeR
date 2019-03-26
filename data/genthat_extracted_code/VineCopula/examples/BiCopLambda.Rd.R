library(VineCopula)


### Name: BiCopLambda
### Title: Lambda-Function (Plot) for Bivariate Copula Data
### Aliases: BiCopLambda

### ** Examples

## Don't show: 
set.seed(123)
## End(Don't show)
# simulate from Clayton copula
cop <- BiCop(3, tau = 0.5)
dat <- BiCopSim(1000, cop)

# create lambda-function plots
op <- par(mfrow = c(1, 3))
BiCopLambda(dat[, 1], dat[, 2])  # empirical lambda-function
BiCopLambda(cop)	# theoretical lambda-function
BiCopLambda(dat[, 1], dat[, 2], cop)	# both
par(op)





