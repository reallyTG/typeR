library(BayesFM)


### Name: simul.dedic.facmod
### Title: Generate synthetic data from a dedicated factor model
### Aliases: simul.dedic.facmod

### ** Examples

# generate 1000 observations from model with 4 factors and 20 variables
# (5 variables loading on each factor)
dat <- simul.dedic.facmod(N = 1000, dedic = rep(1:4, each = 5))

# generate data set with 5000 observations from the following model:
dedic <- rep(1:3, each = 4)        # 3 factors and 12 manifest variables
alpha <- rep(c(1, NA, NA, NA), 3)  # set first loading to 1 for each factor,
                                   #   sample remaining loadings from default
sigma <- rep(0.5, 12)              # idiosyncratic variances all set to 0.5
R <- toeplitz(c(1, .6, .3))        # Toeplitz matrix
dat <- simul.dedic.facmod(N = 5000, dedic, alpha, sigma, R)




