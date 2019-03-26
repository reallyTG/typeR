library(carx)


### Name: outlier.carx
### Title: Detect all outliers of a 'carx' object
### Aliases: outlier.carx

### ** Examples

sigma = 0.6
nObs = 100
dat = carxSimCenTS(nObs=nObs,sigma=sigma,ucl=Inf)
dat$y[as.integer(nObs/2)] = dat$y[as.integer(nObs/2)] + 4*sd(dat$y)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
oc = outlier(mdl)
#note the outlier indices in the output:
print(oc)
#note the updated formula:
print(formula(oc))



