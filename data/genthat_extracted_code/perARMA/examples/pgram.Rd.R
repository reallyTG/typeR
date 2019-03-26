library(perARMA)


### Name: pgram
### Title: Plotting the periodogram of time series
### Aliases: pgram
### Keywords: periodogram

### ** Examples

data(volumes)
dev.set(which=1)
pgram(t(volumes),length(volumes),datastr='volumes')



