library(tolerance)


### Name: poislindtol.int
### Title: Poisson-Lindley Tolerance Intervals
### Aliases: poislindtol.int
### Keywords: file

### ** Examples

## 90%/90% 1-sided tolerance intervals for data assuming 
## the Poisson-Lindley distribution.

x <- c(rep(0, 447), rep(1, 132), rep(2, 42), rep(3, 21), 
       rep(4, 3), rep(5, 2))
out <- poislindtol.int(x, alpha = 0.10, P = 0.90, side = 1)
out



