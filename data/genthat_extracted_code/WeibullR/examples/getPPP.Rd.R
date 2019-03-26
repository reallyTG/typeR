library(WeibullR)


### Name: getPPP
### Title: Alias for 'getPercentilePlottingPositions', sets data into the
###   format required by lslr.
### Aliases: getPPP
### Keywords: regression reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
median_percentile_ranks<-getPPP(failures, suspensions)[,2]



