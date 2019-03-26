library(NormalLaplace)


### Name: NormalLaplaceDistribution
### Title: Normal Laplace Distribution
### Aliases: NormalLaplaceDistribution dnl pnl qnl rnl
### Keywords: distribution

### ** Examples

param <- c(0,1,3,2)
par(mfrow = c(1,2))


## Curves of density and distribution
curve(dnl(x, param = param), -5, 5, n = 1000)
title("Density of the Normal Laplace Distribution")
curve(pnl(x, param = param), -5, 5, n = 1000)
title("Distribution Function of the Normal Laplace Distribution")


## Example of density and random numbers
 par(mfrow = c(1,1))
 param1  <-  c(0,1,1,1)
 data1  <-  rnl(1000, param = param1)
 curve(dnl(x, param = param1),
       from = -5, to = 5, n = 1000, col = 2)
 hist(data1, freq = FALSE, add = TRUE)
 title("Density and Histogram")





