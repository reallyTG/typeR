library(aqp)


### Name: resample.twotheta
### Title: Resample an XRD Pattern
### Aliases: resample.twotheta
### Keywords: manip

### ** Examples

data(rruff.sample)

# resample single pattern
nontronite.resamp <- with(rruff.sample, 
resample.twotheta(twotheta, nontronite, new.res=0.02) )

# plot original vs. resampled pattern
plot(nontronite ~ twotheta, data=rruff.sample, type='l', col='grey')
lines(nontronite.resamp, col='blue')




