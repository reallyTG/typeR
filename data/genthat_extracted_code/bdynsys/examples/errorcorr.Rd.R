library(bdynsys)


### Name: errorcorr
### Title: Controlling Error Correlations in Models with Panel Data
### Aliases: errorcorr
### Keywords: stats

### ** Examples

## Controlling Error Correlations with two indicators and with the following two models:
## dx/dt  = + 0.0012 /x^2 and dy/dt = + 0.0071 x^3

errorcorr(datap, 2, datap$logGDP, datap$EmanzV, 
f <- function(Y=c()) rbind(0.0012/Y[1]^2, + 0.0071*Y[1]^3), c(11), c(14), 2)



