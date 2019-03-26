library(tolerance)


### Name: dparetotol.int
### Title: Discrete Pareto Tolerance Intervals
### Aliases: dparetotol.int
### Keywords: file

### ** Examples

## 95%/95% 1-sided tolerance intervals for data assuming 
## the discrete Pareto distribution.

set.seed(100)

x <- rdpareto(n = 500, theta = 0.5)
out <- dparetotol.int(x, alpha = 0.05, P = 0.95, side = 1)
out



