library(tfplot)


### Name: percentChange
### Title: Various Time Series Calculations
### Aliases: percentChange percentChange.default ytoypc ytoypc.default
###   annualizedGrowth annualizedGrowth.default
### Keywords: ts

### ** Examples

z <- ts(matrix(100 + rnorm(200),100,2), start=c(1990,1), frequency=12)
z[z == 0] <- 1 # not to likely, but it can happen
zyypc <- ytoypc(z)
zpc <- percentChange(z)
zag <- annualizedGrowth(z)



