library(CPAT)


### Name: rchangepoint
### Title: Simulate Univariate Data With a Single Change Point
### Aliases: rchangepoint

### ** Examples

CPAT:::rchangepoint(500)
CPAT:::rchangepoint(500, changepoint = 10, mean2 = 2, sd = 2)
CPAT:::rchangepoint(500, changepoint = 250, dist = rexp, meanparam = "rate",
                    mean1 = 1, mean2 = 2)



