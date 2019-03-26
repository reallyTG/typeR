library(zipfR)


### Name: sample.tfl
### Title: Incremental Samples from a Type Frequency List (zipfR)
### Aliases: sample.tfl
### Keywords: manip distribution

### ** Examples


## load Brown tfl
data(Brown.tfl)
summary(Brown.tfl)

## sample a tfl of 100k tokens
MiniBrown.tfl <- sample.tfl(Brown.tfl,1e+5)
summary(MiniBrown.tfl)

## if we repat, we get a different sample
MiniBrown.tfl <- sample.tfl(Brown.tfl,1e+5)
summary(MiniBrown.tfl)




