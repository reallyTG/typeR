library(changepoint.mv)


### Name: cpts.mv
### Title: Multivariate changepoint locations.
### Aliases: cpts.mv cpts.mv,changepoint.mv.mrc.class-method

### ** Examples

library(changepoint.mv)
data(mrcexample)
res<-mrc(mrcexample)
cpts.mv(res)
cpts.mv(res,p=3)




