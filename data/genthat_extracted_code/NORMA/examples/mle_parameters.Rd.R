library(NORMA)


### Name: mle_parameters
### Title: MLE Parameters
### Aliases: beta_mle general_gaussian_mle general_laplace_mle
###   mle_parameters moge_mle weibull_mle zero_gaussian_mle
###   zero_laplace_mle

### ** Examples

# Estimate optimal parameters using default distribution ("nm").
mle_parameters(rnorm(100))

# Estimate optimal parameters using "lm" distribution.
mle_parameters(rnorm(100),dist="lm")

# Equivalent to mle_parameters(rnorm(100),dist="l")
zero_laplace_mle(rnorm(100))

# Equivalent to mle_parameters(rnorm(100),dist="lm")
general_laplace_mle(rnorm(100))

# Equivalent to mle_parameters(rnorm(100),dist="n")
zero_gaussian_mle(rnorm(100))

# Equivalent to mle_parameters(rnorm(100),dist="nm")
general_gaussian_mle(rnorm(100))

# Equivalent to mle_parameters(rnorm(100),dist="b")
beta_mle(rnorm(100))

# Equivalent to mle_parameters(rnorm(100),dist="w")
weibull_mle(rnorm(100))

# Equivalent to mle_parameters(rnorm(100),dist="moge")
moge_mle(rnorm(100))



