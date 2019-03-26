library(tolerance)


### Name: fidnegbintol.int
### Title: Fiducial-Based Tolerance Intervals for the Function of Two
###   Negative Binomial Proportions
### Aliases: fidnegbintol.int
### Keywords: file

### ** Examples

## 95%/99% 1-sided and 2-sided tolerance intervals for 
## the ratio of odds ratios for negative binomial proportions.

set.seed(100)

p1 <- 0.6
p2 <- 0.2
n1 <- n2 <- 50
x1 <- rnbinom(1, n1, p1)
x2 <- rnbinom(1, n2, p2)
fun.ti <- function(x, y) x * (1 - y) / (y * (1 - x))

fidnegbintol.int(x1, x2, n1, n2, m1 = 50, m2 = 50, FUN = fun.ti, 
                 alpha = 0.05, P = 0.99, side = 1)
fidnegbintol.int(x1, x2, n1, n2, m1 = 50, m2 = 50, FUN = fun.ti, 
                 alpha = 0.05, P = 0.99, side = 2)
              



