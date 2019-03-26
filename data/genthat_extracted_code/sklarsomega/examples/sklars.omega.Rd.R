library(sklarsomega)


### Name: sklars.omega
### Title: Apply Sklar's Omega.
### Aliases: sklars.omega

### ** Examples

## No test: 
# The following data were presented in Krippendorff (2013).

data = matrix(c(1,2,3,3,2,1,4,1,2,NA,NA,NA,
                1,2,3,3,2,2,4,1,2,5,NA,3,
                NA,3,3,3,2,3,4,2,2,5,1,NA,
                1,2,3,3,2,4,4,1,2,5,1,NA), 12, 4)
colnames(data) = c("c.1.1", "c.2.1", "c.3.1", "c.4.1")
data

# Compute asymptotic confidence intervals. Since the distributional transform
# approximation is used, the asymptotic covariance matrix has a sandwich form.
# We use a bootstrap estimator of the "filling" (the variance of the score).
# Obtain a bootstrap sample of size 1,000. Do the bootstrap in parallel, using
# all but one of the available cores. Since we set 'verbose' equal to TRUE, a
# progress bar is displayed during the bootstrap.

set.seed(12)
fit = sklars.omega(data, level = "nominal", confint = "asymptotic", verbose = TRUE,
                   control = list(bootit = 1000, parallel = TRUE,
                   nodes = parallel::detectCores() - 1))
summary(fit)
## End(No test)
# Fit a subset of the cartilage data, assuming a Laplace marginal distribution. Compute
# confidence intervals in the usual ML way (observed information matrix).

data(cartilage)
data = as.matrix(cartilage)[1:100, ]
colnames(data) = c("c.1.1", "c.2.1")
fit = sklars.omega(data, level = "interval", confint = "asymptotic",
                   control = list(dist = "laplace"))
summary(fit)
vcov(fit)

# Now assume a t marginal distribution.

fit = sklars.omega(data, level = "interval", confint = "asymptotic",
                   control = list(dist = "t"))
summary(fit)
vcov(fit)



