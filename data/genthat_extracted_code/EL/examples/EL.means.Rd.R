library(EL)


### Name: EL.means
### Title: Empirical likelihood test for the difference of two sample means
### Aliases: EL.means
### Keywords: ~nonparametric ~htest

### ** Examples

X <- rnorm(100)
Y <- rnorm(100)
t.test(X, Y)
EL.means(X, Y)
EL.Huber(X, Y)



