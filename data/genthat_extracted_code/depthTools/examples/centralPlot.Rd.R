library(depthTools)


### Name: centralPlot
### Title: Plot of the central curves
### Aliases: centralPlot
### Keywords: multivariate

### ** Examples

  ## simulated data
  set.seed(0)  
  x <- matrix(rnorm(100),10,10)
  centralPlot(x,p=0.2)

  ## real data
  data(prostate)
  prost.x<-prostate[,1:100]
  prost.y<-prostate[,101]
  centralPlot(prost.x[prost.y==0,], p=0.5)  ## 50 % most central normal samples
  centralPlot(prost.x[prost.y==1,], p=0.5, gradient=TRUE, main='Tumor samples')  
                                            ## 50 % most central tumoral samples



