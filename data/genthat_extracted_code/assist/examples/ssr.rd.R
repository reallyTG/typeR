library(assist)


### Name: ssr
### Title: Fit a General Smoothing Spline Regression Model
### Aliases: ssr
### Keywords: file

### ** Examples

## Not run: library(MASS)
# fitting a cubic spline
## Not run: fit1<- ssr(accel~times, data=mcycle, scale=T, rk=cubic(times))
## Not run: summary(fit1)

# using GML to choose the smoothing parameter
## Not run: fit2<- update(fit1, spar="m")

data(acid)
## fit an additive thin plate spline
acid.fit<- ssr( ph ~ t1 + x1 + x2, rk = list(tp(t1), tp(list(x1, x2))), 
        data = acid, spar = "m", scale = FALSE)
acid.fit



