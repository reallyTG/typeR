library(zipfR)


### Name: sample.spc
### Title: Incremental Samples from a Frequency Spectrum (zipfR)
### Aliases: sample.spc
### Keywords: manip distribution

### ** Examples


## read Brown spectrum
data(Brown.spc)
summary(Brown.spc)

## sample a spectrum of 100k tokens
MiniBrown.spc <- sample.spc(Brown.spc,1e+5)
summary(MiniBrown.spc)

## if we repat, we get a different sample
MiniBrown.spc <- sample.spc(Brown.spc,1e+5)
summary(MiniBrown.spc)




