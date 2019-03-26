library(Compositional)


### Name: Empirical likelihood for a one sample mean vector hypothesis testing
### Title: Empirical likelihood for a one sample mean vector hypothesis
###   testing
### Aliases: el.test1
### Keywords: Hypothesis test mean vector

### ** Examples

x <- Rfast::rmvnorm(100, numeric(10), diag( rexp(10, 0.5) ) )
el.test1(x, mu = numeric(10) )
eel.test1(x, mu = numeric(10) )



