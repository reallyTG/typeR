library(WeibullR)


### Name: getPercentilePlottingPositions
### Title: Determination of percentile plotting positions for linear
###   regression with many optional methods
### Aliases: getPercentilePlottingPositions
### Keywords: median ranks

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
median_percentile_ranks<-getPPP(failures,suspensions)[,2]



