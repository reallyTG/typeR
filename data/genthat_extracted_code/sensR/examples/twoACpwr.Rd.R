library(sensR)


### Name: twoACpwr
### Title: Exact Power Computation for the 2-AC Discrimination Protocol
### Aliases: twoACpwr
### Keywords: models

### ** Examples


## Exact power: 
twoACpwr(tau = .5, d.prime = .7, size = 50, tol = 0)

## Power exact to a reasonable number of digits
twoACpwr(tau = .5, d.prime = .7, size = 50, tol = 1e-5)

## Power for a similarity test in a discrimination setting where the
## true parameter values are expected to be tau = 0.4 and true d.prime
## = .5, while we want to show that d.prime < 1, i.e., under the null
## hypothesis d.prime = 1:
twoACpwr(tau = .4, d.prime = .5, size = 100, d.prime0 = 1, tol = 1e-5, 
         alternative = "less")

## Power for a difference test in a preference setting where the true
## parameter values are expected to be tau = 0.4 and d.prime = -0.5,
## while we want to show that d.prime is different from zero:
twoACpwr(tau = 0.4, d.prime = -0.5, size = 100, d.prime0 = 0, tol = 1e-5, 
         alternative = "two.sided")




