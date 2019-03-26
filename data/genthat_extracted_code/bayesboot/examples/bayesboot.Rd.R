library(bayesboot)


### Name: bayesboot
### Title: The Bayesian bootstrap
### Aliases: bayesboot

### ** Examples


### A Bayesian bootstrap analysis of a mean ###

# Heights of the last ten American presidents in cm (Kennedy to Obama).
heights <- c(183, 192, 182, 183, 177, 185, 188, 188, 182, 185);
b1 <- bayesboot(heights, mean)
# But it's more efficient to use the a weighted statistic.
b2 <- bayesboot(heights, weighted.mean, use.weights = TRUE)

# The result of bayesboot can be plotted and summarized
plot(b2)
summary(b2)

# It can also be easily post processed.
# Here the probability that the mean is > 182 cm.
mean( b2[,1] > 182)

### A Bayesian bootstrap analysis of a SD ###

# When use.weights = FALSE it is important that the summary statistics
# does not change as a function of sample size. This is the case with
# the sample standard deviation, so here we have to implement a
# function calculating the population standard deviation.
pop.sd <- function(x) {
  n <- length(x)
  sd(x) * sqrt( (n - 1) / n)
}

b3 <- bayesboot(heights, pop.sd)
summary(b3)

### A Bayesian bootstrap analysis of a correlation coefficient ###

# Data comparing two methods of measuring blood flow.
# From Table 1 in Miller (1974) and used in an example
# by Rubin (1981, p. 132).
blood.flow <- data.frame(
  dye = c(1.15, 1.7, 1.42, 1.38, 2.80, 4.7, 4.8, 1.41, 3.9),
  efp = c(1.38, 1.72, 1.59, 1.47, 1.66, 3.45, 3.87, 1.31, 3.75))

# Using the weighted correlation (corr) from the boot package.
library(boot)
b4 <- bayesboot(blood.flow, corr, R = 1000, use.weights = TRUE)
hist(b4[,1])

### A Bayesian bootstrap analysis of lm coefficients ###

# A custom function that returns the coefficients of
# a weighted linear regression on the blood.flow data
lm.coefs <- function(d, w) {
  coef( lm(efp ~ dye, data = d, weights = w) )
}

b5 <- bayesboot(blood.flow, lm.coefs, R = 1000, use.weights = TRUE)

# Plotting the marginal posteriors
plot(b5)

# Plotting a scatter of regression lines from the posterior
plot(blood.flow)
for(i in sample(nrow(b5), size = 20)) {
  abline(coef = b5[i, ], col = "grey")
}



