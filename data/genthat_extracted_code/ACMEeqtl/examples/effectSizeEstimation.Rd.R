library(ACMEeqtl)


### Name: effectSizeEstimation
### Title: Estimate Non-Linear Model for the Effect of Genotype on Gene
###   Expression
### Aliases: effectSizeEstimationC effectSizeEstimationR

### ** Examples

# Model parameters
beta0 = 10000
beta = 50000

# Data dimensions
n = 1000
p = 19

# Standard deviation of covariate effects and noise
cvrtsd = 10
noisesd = 1

### Data generation
### Zero average covariates
cvrt = matrix(rnorm(n * p, sd = cvrtsd), n, p)
cvrt = t(t(cvrt) - colMeans(cvrt))

c_eff = rnorm(p, sd = cvrtsd)
error = rnorm(n, sd = noisesd)

# Generate SNPs
x = rbinom(n, size = 2, prob = 0.2)
y = log(beta0 + beta * x) + cvrt %*% c_eff + error

### Model estimation

z1 = effectSizeEstimationR(x, y, cvrt)
z2 = effectSizeEstimationC(x, y, cvrt)

### Compare the estimates

show(cbind(z1, z2))



