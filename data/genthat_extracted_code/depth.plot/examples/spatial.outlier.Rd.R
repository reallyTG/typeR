library(depth.plot)


### Name: spatial.outlier
### Title: Multivariate Spatial Outlier
### Aliases: spatial.outlier

### ** Examples

u<-matrix(rnorm(60,0,1),ncol=3)
u0<-matrix(runif(9,3,4),ncol=3)
spatial.outlier(u,rbind(u,u0))



