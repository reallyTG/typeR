library(seqtest)


### Name: size.mean
### Title: Sample size determination for testing the arithmetic mean
### Aliases: size.mean

### ** Examples


#--------------------------------------
# Two-sided one-sample test
# H0: mu = mu.0, H1: mu != mu.0
# alpha = 0.05, beta = 0.2, theta = 0.5

size.mean(theta = 0.5, sample = "one.sample",
          alternative = "two.sided", alpha = 0.05, beta = 0.2)

#--------------------------------------
# One-sided one-sample test
# H0: mu <= mu.0, H1: mu > mu.0
# alpha = 0.05, beta = 0.2, theta = 0.5

size.mean(theta = 0.5, sample = "one.sample",
          alternative = "greater", alpha = 0.05, beta = 0.2)

#--------------------------------------
# Two-sided two-sample test
# H0: mu.1 = mu.2, H1: mu.1 != mu.2
# alpha = 0.01, beta = 0.1, theta = 1

size.mean(theta = 1, sample = "two.sample",
          alternative = "two.sided", alpha = 0.01, beta = 0.1)

#--------------------------------------
# One-sided two-sample test
# H0: mu.1 <= mu.2, H1: mu.1 > mu.2
# alpha = 0.01, beta = 0.1, theta = 1

size.mean(theta = 1, sample = "two.sample",
          alternative = "greater", alpha = 0.01, beta = 0.1)



