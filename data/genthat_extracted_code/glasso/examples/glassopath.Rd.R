library(glasso)


### Name: glassopath
### Title: Compute the Graphical lasso along a path
### Aliases: glassopath
### Keywords: multivariate models graphs

### ** Examples



set.seed(100)

x<-matrix(rnorm(50*20),ncol=20)
s<- var(x)
a<-glassopath(s)




