library(AdaptGauss)


### Name: Pdf4Mixtures
### Title: Calculates pdf for GMM
### Aliases: Pdf4Mixtures
### Keywords: GMM gaussian mixture model pdf probability density function

### ** Examples

data=c(rnorm(1000),rnorm(2000)+2,rnorm(1000)*2-1)
Pdf4Mixtures(data,c(-1,0,2),c(2,1,1),c(0.25,0.25,0.5), PlotIt=TRUE)



