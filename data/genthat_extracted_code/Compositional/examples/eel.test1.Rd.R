library(Compositional)


### Name: Exponential empirical likelihood for a one sample mean vector hypothesis testing
### Title: Exponential empirical likelihood for a one sample mean vector
###   hypothesis testing
### Aliases: eel.test1
### Keywords: Hypothesis test mean vector

### ** Examples

x <- Rfast::rmvnorm(100, numeric(10), diag( rexp(10, 0.5) ) )
eel.test1(x, numeric(10) )
el.test1(x, numeric(10) )



