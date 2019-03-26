library(multitaper)


### Name: willamette
### Title: Willamette River time series
### Aliases: willamette
### Keywords: datasets

### ** Examples

data(willamette)
# time series object, January = year.0, December = year.917
will.ts <- ts(data=willamette, start=(1950+9/12), freq=12)



