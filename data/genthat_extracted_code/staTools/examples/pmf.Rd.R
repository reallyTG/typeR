library(staTools)


### Name: pmf
### Title: Probability Mass Function
### Aliases: pmf
### Keywords: empirical function mass probability

### ** Examples

x = rdispl(n = 1e4, xmin = 10, alpha = 2.5, xmax = 1e5)
obs = pmf(x)$x
probs = pmf(x)$y



