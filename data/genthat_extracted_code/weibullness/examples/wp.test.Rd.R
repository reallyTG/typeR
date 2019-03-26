library(weibullness)


### Name: wp.test
### Title: The Weibullness Test from the Weibull Plot
### Aliases: wp.test wp.test.pvalue wp.test.critical Weibullness
###   weibullness

### ** Examples

# For Weibullness hypothesis test
x = rweibull(10, shape=1)
wp.test(x)

# p.value with r (sample correlation from the Weibull plot) and n (sample size) are given
wp.test.pvalue(r=0.6, n=10)

# Critical value with alpha (significance level) and n (sample size).
wp.test.critical(alpha=0.01, n=10)



