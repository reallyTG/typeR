library(LearnBayes)


### Name: mycontour
### Title: Contour plot of a bivariate density function
### Aliases: mycontour
### Keywords: models

### ** Examples

m=array(c(0,0),c(2,1))
v=array(c(1,.6,.6,1),c(2,2))
normpar=list(m=m,v=v)
mycontour(lbinorm,c(-4,4,-4,4),normpar)



