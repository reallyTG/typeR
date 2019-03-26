library(GoFKernel)


### Name: fan.test
### Title: Univariate implementation of the test of Fan (1994) in the form
###   proposed by Li and Racine (2007).
### Aliases: fan.test
### Keywords: htest

### ** Examples

fan.test(runif(100), dunif, lower=0, upper=1)

f0 <- function(x) ifelse(x>=0 & x<=1, 2-2*x, 0)
## testing if risk76.1929 follows the distribution characterized by f0
fan.test(risk76.1929, f0, lower=0, upper=1, kernel="epanech")




