library(itsmr)


### Name: ma.inf
### Title: Compute MA infinity coefficients
### Aliases: ma.inf

### ** Examples

M = c("diff",12)
e = Resid(deaths,M)
a = arma(e,1,1)
ma.inf(a,10)



