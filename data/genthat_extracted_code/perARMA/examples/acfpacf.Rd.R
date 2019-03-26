library(perARMA)


### Name: acfpacf
### Title: Plotting usual ACF and PACF
### Aliases: acfpacf acfpacf.acf acfpacf.pacf
### Keywords: ACF PACF

### ** Examples

data(volumes)
# for original data
dev.set(which=1)
acfpacf(volumes,24,24,'volumes')

# for data after removing periodic mean
pmean_out<-permest(t(volumes),24, 0.05, NaN,'volumes',pp=0)
xd=pmean_out$xd
dev.set(which=1)
acfpacf(xd,24,24,'volumes')



