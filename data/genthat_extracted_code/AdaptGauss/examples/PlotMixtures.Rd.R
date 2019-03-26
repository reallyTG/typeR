library(AdaptGauss)


### Name: PlotMixtures
### Title: Shows GMM
### Aliases: PlotMixtures
### Keywords: GMM gaussian mixture model

### ** Examples

data=c(rnorm(1000),rnorm(2000)+2,rnorm(1000)*2-1)
PlotMixtures(data,c(-1,0,2),c(2,1,1),c(0.25,0.25,0.5),SingleColor='blue',SingleGausses=TRUE)



