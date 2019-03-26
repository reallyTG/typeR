library(LearnBayes)


### Name: simcontour
### Title: Simulated draws from a bivariate density function on a grid
### Aliases: simcontour
### Keywords: models

### ** Examples

m=array(c(0,0),c(2,1))
v=array(c(1,.6,.6,1),c(2,2))
normpar=list(m=m,v=v)
s=simcontour(lbinorm,c(-4,4,-4,4),normpar,1000)
plot(s$x,s$y)



