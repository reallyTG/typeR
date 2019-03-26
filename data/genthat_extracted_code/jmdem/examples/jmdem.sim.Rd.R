library(jmdem)


### Name: jmdem.sim
### Title: Simulate joint mean and dispersion effects models fits
### Aliases: jmdem.sim simdata.jmdem.sim getdata.jmdem.sim

### ** Examples

## Run 10 JMDEM simulations with samples of size 50. The response
## variable is Gaussian with mean beta_0 + beta_1 * x and variance 
## log(sigma^2) = lambda_0 + lambda_1 * z. The observations of 
## the predictor x should be random numbers generated from the normal 
## distribution with mean 0 and standard deviation 2. The observations
## of z are factors with three levels between 0 and 2, generated from 
## the uniform distribution. The true values of the mean submodel's 
## intercept and slope are 1.5 and 4, as well as 2.5, 3 and -0.2 for 
## the dispersion submodel's intercept and slope.
sim <- jmdem.sim(mformula = y ~ x, dformula = ~ z, beta.first = TRUE, 
                 mfamily = gaussian, dfamily = Gamma(link = "log"), 
                 x.str = list(type = "numeric", random.func = "rnorm", 
                              param = list(mean = 0, sd = 2)),
                 z.str = list(type = "factor", random.func = "runif", 
                              param = list(min = 0, max = 2)),
                 beta.true = c(1.5, 4), lambda.true = c(2.5, 3, -0.2), 
                 grad.func = TRUE, method = "BFGS", n = 50,
                 simnum = 10)



