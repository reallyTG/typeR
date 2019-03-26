library(glogis)


### Name: glogisfit
### Title: Fitting the Generalized Logistic Distribution
### Aliases: glogisfit glogisfit.default glogisfit.formula bread.glogisfit
###   coef.glogisfit estfun.glogisfit hist.glogisfit lines.glogisfit
###   logLik.glogisfit plot.glogisfit print.glogisfit
###   print.summary.glogisfit residuals.glogisfit summary.glogisfit
###   vcov.glogisfit
### Keywords: regression

### ** Examples

## simple artificial example
set.seed(2)
x <- rglogis(1000, -1, scale = 0.5, shape = 3)
gf <- glogisfit(x)
plot(gf)
summary(gf)

## query parameters and associated moments
coef(gf)
coef(gf, log = FALSE)
gf$parameters
gf$moments



