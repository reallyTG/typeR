library(EL)


### Name: EL.Huber
### Title: Empirical likelihood test for the difference of smoothed Huber
###   estimators
### Aliases: EL.Huber
### Keywords: ~nonparametric ~smooth ~htest

### ** Examples

X <- rnorm(100)
Y <- rnorm(100)
t.test(X, Y)
EL.means(X, Y)
EL.Huber(X, Y)



