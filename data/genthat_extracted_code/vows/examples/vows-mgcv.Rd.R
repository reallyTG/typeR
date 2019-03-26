library(vows)


### Name: vows-mgcv
### Title: Utility functions related to the mgcv package
### Aliases: Predict.matrix.bspline.smooth smooth.construct.be.smooth.spec
###   smooth.construct.bq.smooth.spec vows-mgcv

### ** Examples


x. = rnorm(20)
smoo.be <- smooth.construct.be.smooth.spec(s(x), data.frame(x = x.), NULL)
smoo.bq <- smooth.construct.bq.smooth.spec(s(x), data.frame(x = x.), NULL)
Predict.matrix.bspline.smooth(smoo.bq, data.frame(x = seq(min(x.),max(x.),,100)))




