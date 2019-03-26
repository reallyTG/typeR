library(EbayesThresh)


### Name: ebayesthresh
### Title: Empirical Bayes thresholding on a sequence
### Aliases: ebayesthresh
### Keywords: nonparametric

### ** Examples


# Data with homogeneous sampling standard deviation using 
# Cauchy prior.
eb1 <- ebayesthresh(x = rnorm(100, c(rep(0,90),rep(5,10))),
                     prior = "cauchy", sdev = NA)

# Data with homogeneous sampling standard deviation using 
# Laplace prior.
eb2 <- ebayesthresh(x = rnorm(100, c(rep(0,90), rep(5,10))),
                     prior = "laplace", sdev = 1)
             
# Data with heterogeneous sampling standard deviation using 
# Laplace prior.
set.seed(123)
mu <- c(rep(0,90), rep(5,10))
sd <- c(rep(1, 40), rep(3, 60))
x  <- mu + rnorm(100, sd = sd)

# With constraints on thresholds.
eb3 <- ebayesthresh(x = x, prior = "laplace", a = NA, sdev = sd)

# Without constraints on thresholds. Observe that the estimates with
# constraints on thresholds have fewer zeroes than the estimates without
# constraints.
eb4 <- ebayesthresh(x = x, prior = "laplace", a = NA, sdev = sd,
                     universalthresh = FALSE)
print(sum(eb3 == 0))
print(sum(eb4 == 0))

# Data with heterogeneous sampling standard deviation using Laplace
# prior.
set.seed(123)
mu <- c(rep(0,90), rep(5,10))
sd <- c(rep(1, 40), rep(5,40), rep(15, 20))
x  <- mu + rnorm(100, sd = sd)

# In this example, infinity is returned as estimate when some of the
# sampling standard deviations are extremely large. However, this can
# be solved by stabilizing the data sequence before the analysis.
eb5 <- ebayesthresh(x = x, prior = "laplace", a = NA, sdev = sd)

# With stabilization.
eb6 <- ebayesthresh(x = x, prior = "laplace", a = NA, sdev = sd,
                    stabadjustment = TRUE)




