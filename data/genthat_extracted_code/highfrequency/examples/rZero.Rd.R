library(highfrequency)


### Name: rZero
### Title: Calculates the percentage of co-zero returns at a specified
###   sampling period
### Aliases: rZero
### Keywords: methods

### ** Examples

data(sbux.xts)
data(lltc.xts)
rZero( rdata = list(sbux.xts, lltc.xts) , period = 60, align.by ="seconds", align.period=1)



