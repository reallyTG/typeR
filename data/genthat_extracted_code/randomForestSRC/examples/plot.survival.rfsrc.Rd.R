library(randomForestSRC)


### Name: plot.survival
### Title: Plot of Survival Estimates
### Aliases: plot.survival plot.survival.rfsrc
### Keywords: plot

### ** Examples

## No test: 
## veteran data
data(veteran, package = "randomForestSRC") 
plot.survival(rfsrc(Surv(time, status)~ ., veteran), cens.model = "rfsrc")

## pbc data
data(pbc, package = "randomForestSRC") 
pbc.obj <- rfsrc(Surv(days, status) ~ ., pbc)

# default spline approach
plot.survival(pbc.obj, subset = 3)
plot.survival(pbc.obj, subset = 3, k = 100)

# three-parameter generalized gamma is approximately the same
# but notice that its CHF estimate (blue line) is not as accurate
plot.survival(pbc.obj, subset = 3, haz.model = "ggamma")

# nonparametric method is too wiggly or undersmooths
plot.survival(pbc.obj, subset = 3, haz.model = "nonpar", span = 0.1)
plot.survival(pbc.obj, subset = 3, haz.model = "nonpar", span = 0.8)

## End(No test)



