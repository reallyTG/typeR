library(GLDEX)


### Name: ks.gof
### Title: Kolmogorov-Smirnov test
### Aliases: ks.gof
### Keywords: htest

### ** Examples

x <- rnorm(50)
y <- runif(30)
# Do x and y come from the same distribution?
ks.gof(x, y)
# Does x come from a shifted gamma distribution with shape 3 and rate 2?
ks.gof(x+2, "pgamma", 3, 2) # two-sided, exact
ks.gof(x+2, "pgamma", 3, 2, exact = FALSE)
ks.gof(x+2, "pgamma", 3, 2, alternative = "gr")



