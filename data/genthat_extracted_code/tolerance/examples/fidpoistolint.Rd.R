library(tolerance)


### Name: fidpoistol.int
### Title: Fiducial-Based Tolerance Intervals for the Function of Two
###   Poisson Rates
### Aliases: fidpoistol.int
### Keywords: file

### ** Examples

## 95%/99% 1-sided and 2-sided tolerance intervals for 
## the ratio of two Poisson rates.

set.seed(100)

lambda1 <- 10
lambda2 <- 2
n1 <- 3000
n2 <- 3250
x1 <- rpois(1, n1 * lambda1)
x2 <- rpois(1, n2 * lambda2)
fun.ti <- function(x, y) x / y

fidpoistol.int(x1, x2, n1, n2, m1 = 2000, m2 = 2500, 
               FUN = fun.ti, alpha = 0.05, P = 0.99, side = 1)
fidpoistol.int(x1, x2, n1, n2, m1 = 2000, m2 = 2500, 
               FUN = fun.ti, alpha = 0.05, P = 0.99, side = 2)
              



