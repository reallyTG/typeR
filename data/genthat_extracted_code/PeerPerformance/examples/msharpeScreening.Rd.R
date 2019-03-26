library(PeerPerformance)


### Name: msharpeScreening
### Title: Screening using the modified Sharpe outperformance ratio
### Aliases: msharpeScreening
### Keywords: htest

### ** Examples

## Load the data (randomized data of monthly hedge fund returns)
data("hfdata")
rets = hfdata[,1:10]

## Modified Sharpe screening 
msharpeScreening(rets, control = list(nCore = 1))

## Modified Sharpe screening with bootstrap and HAC standard deviation
msharpeScreening(rets, control = list(nCore = 1, type = 2, hac = TRUE))



