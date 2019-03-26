library(PeerPerformance)


### Name: alphaScreening
### Title: Screening using the alpha outperformance ratio
### Aliases: alphaScreening
### Keywords: htest

### ** Examples

## Load the data (randomized data of monthly hedge fund returns)
data("hfdata")
rets = hfdata[,1:10]

## Run alpha screening 
ctr = list(nCore = 1)
alphaScreening(rets, control = ctr)

## Run alpha screening with HAC standard deviation
ctr = list(nCore = 1, hac = TRUE)
alphaScreening(rets, control = ctr)



