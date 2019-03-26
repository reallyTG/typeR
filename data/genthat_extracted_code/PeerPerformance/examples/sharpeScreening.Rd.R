library(PeerPerformance)


### Name: sharpeScreening
### Title: Screening using the Sharpe outperformance ratio
### Aliases: sharpeScreening
### Keywords: htest

### ** Examples

## Load the data (randomized data of monthly hedge fund returns)
data("hfdata")
rets = hfdata[,1:10]

## Sharpe screening 
sharpeScreening(rets, control = list(nCore = 1))

## Sharpe screening with bootstrap and HAC standard deviation
sharpeScreening(rets, control = list(nCore = 1, type = 2, hac = TRUE))



