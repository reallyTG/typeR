library(depth.plot)


### Name: multi.quant
### Title: Multivariate Quantile
### Aliases: multi.quant

### ** Examples

u<-matrix(rnorm(90,0,1),ncol=3)
u0<-runif(3,0,1)
multi.quant(spatial.rank(u0,u),u)



