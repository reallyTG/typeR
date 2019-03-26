library(tolerance)


### Name: fidbintol.int
### Title: Fiducial-Based Tolerance Intervals for the Function of Two
###   Binomial Proportions
### Aliases: fidbintol.int
### Keywords: file

### ** Examples

## 95%/99% 1-sided and 2-sided tolerance intervals for 
## the difference between binomial proportions.

set.seed(100)

p1 <- 0.2
p2 <- 0.4
n1 <- n2 <- 200
x1 <- rbinom(1, n1, p1)
x2 <- rbinom(1, n2, p2)
fun.ti <- function(x, y) x - y

fidbintol.int(x1, x2, n1, n2, m1 = 500, m2 = 500, FUN = fun.ti,
              alpha = 0.05, P = 0.99, side = 1)
fidbintol.int(x1, x2, n1, n2, m1 = 500, m2 = 500, FUN = fun.ti,
              alpha = 0.05, P = 0.99, side = 2)
              



