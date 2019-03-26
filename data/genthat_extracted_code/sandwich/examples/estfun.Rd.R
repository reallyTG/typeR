library(sandwich)


### Name: estfun
### Title: Extract Empirical Estimating Functions
### Aliases: estfun estfun.lm estfun.glm estfun.mlm estfun.rlm estfun.polr
###   estfun.clm estfun.survreg estfun.coxph estfun.nls estfun.hurdle
###   estfun.zeroinfl estfun.mlogit
### Keywords: regression

### ** Examples

## linear regression
x <- sin(1:10)
y <- rnorm(10)
fm <- lm(y ~ x)

## estimating function: (y - x'beta) * x
estfun(fm)
residuals(fm) * cbind(1, x)



