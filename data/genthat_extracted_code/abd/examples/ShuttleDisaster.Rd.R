library(abd)


### Name: ShuttleDisaster
### Title: Ambient Temperature and O-Ring Failures
### Aliases: ShuttleDisaster
### Keywords: datasets

### ** Examples

str(ShuttleDisaster)
xyplot( jitter(failures, amount=0.1) ~ temperature, ShuttleDisaster,
  ylab='number of failures'
  )



