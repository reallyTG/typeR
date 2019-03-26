library(flux)


### Name: auc
### Title: Calculate the area under a line(curve).
### Aliases: auc auc.mc
### Keywords: math models ts

### ** Examples

## Construct a data set (Imagine 2-hourly ghg emission data
## (methane) measured during a day).
## The emission vector (data in mg CH4 / m2*h) as a time series.
ghg <- ts(c(12.3, 14.7, 17.3, 13.2, 8.5, 7.7, 6.4, 3.2, 19.8, 
22.3, 24.7, 15.6, 17.4), start=0, end=24, frequency=0.5)
## Have a look at the emission development.
plot(ghg)
## Calculate what has been emitted that day
## Assuming that emissions develop linearly between
## measurements
auc(time(ghg), ghg)

## Test some of the auc.mc approaches
## "leave out" as default
auc.rep <- auc.mc(time(ghg), ghg)
## mean and median are well below the original value
summary(auc.rep)
## results for "bootstrap" are unstable (run several times)
auc.rep <- auc.mc(time(ghg), ghg, "boot")
summary(auc.rep)
## results for "jack-validate" are stable (run several times)
auc.rep <- auc.mc(time(ghg), ghg, "jack-val", lo=3)
summary(auc.rep)

## The effect of below.zero:
## Shift data, so that we have negative emissions (immissions)
ghg <- ghg-10
## See the difference
plot(ghg)
abline(h=0)
## With thresh = NULL the negative emissions are subtracted
## from the positive emissions
auc(time(ghg), ghg)
## With thresh = -0.5 the negative emissions are set to -0.5
## and only the emissions >= -0.5 count.
auc(time(ghg), ghg, thresh = -0.5)




