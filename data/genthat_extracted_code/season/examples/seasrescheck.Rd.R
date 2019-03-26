library(season)


### Name: seasrescheck
### Title: Seasonal Residual Checks
### Aliases: seasrescheck

### ** Examples
## No test: 
# cardiovascular disease data
# (use an offset of the scaled number of days in a month)
data(CVD)
model = cosinor(cvd~1, date=month, data=CVD, type='monthly',
                family=poisson(), offsetmonth=TRUE)
seasrescheck(resid(model))
## End(No test)



