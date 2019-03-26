library(SoDA)


### Name: randomSlippage
### Title: Are simulated sequences robust?
### Aliases: randomSlippage
### Keywords: distribution programming

### ** Examples

set.seed(211)
RNGkind("default", "Ahrens")
xx = randomSlippage(1000, rnorm(20), rnorm(20))
table(xx[,1], xx[,2])



