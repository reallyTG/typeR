library(binom)


### Name: binom.bayes
### Title: Binomial confidence intervals using Bayesian inference
### Aliases: binom.bayes binom.bayes.densityplot
### Keywords: univar htest models

### ** Examples

# Example using highest probability density.
hpd <- binom.bayes(
  x = 0:10, n = 10, type = "highest", conf.level = 0.8, tol = 1e-9)
print(hpd)
binom.bayes.densityplot(hpd)
# Remove the extremes from the plot since they make things hard
# to see.
binom.bayes.densityplot(hpd[hpd$x != 0 & hpd$x != 10, ])

# Example using central probability.
central <- binom.bayes(
  x = 0:10, n = 10, type = "central", conf.level = 0.8, tol = 1e-9)
print(central)
binom.bayes.densityplot(central)
# Remove the extremes from the plot since they make things hard
# to see.
binom.bayes.densityplot(central[central$x != 0 & central$x != 10, ])




