library(tolerance)


### Name: negbintol.int
### Title: Negative Binomial Tolerance Intervals
### Aliases: negbintol.int
### Keywords: file

### ** Examples
 
## Comparison of 95%/99% 1-sided tolerance limits with
## 50 failures before 10 successes are reached.

negbintol.int(x = 50, n = 10, side = 1, method = "LS")
negbintol.int(x = 50, n = 10, side = 1, method = "WU")
negbintol.int(x = 50, n = 10, side = 1, method = "CB")
negbintol.int(x = 50, n = 10, side = 1, method = "CS")
negbintol.int(x = 50, n = 10, side = 1, method = "SC")
negbintol.int(x = 50, n = 10, side = 1, method = "LR")
negbintol.int(x = 50, n = 10, side = 1, method = "SP")
negbintol.int(x = 50, n = 10, side = 1, method = "CC")

## 95%/99% 1-sided tolerance limits and 2-sided tolerance 
## interval for the same setting above, but when we are 
## interested in a future experiment that requires 20 successes 
## be reached for each trial.

negbintol.int(x = 50, n = 10, m = 20, side = 1)
negbintol.int(x = 50, n = 10, m = 20, side = 2)



