library(itsmr)


### Name: Resid
### Title: Compute residuals
### Aliases: Resid

### ** Examples

M = c("log","season",12,"trend",1)
e = Resid(wine,M)

a = arma(e,1,1)
ee = Resid(wine,M,a)



