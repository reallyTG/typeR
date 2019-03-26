library(hydroTSM)


### Name: sfreq
### Title: Sampling Frequency
### Aliases: sfreq
### Keywords: manip

### ** Examples

## Loading temperature data ##
## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)
d <- OcaEnOnaQts

## Daily to Monthly
m <- daily2monthly(d, FUN=mean, na.rm=TRUE)

## Daily to Annual
a <- daily2annual(d, FUN=mean, na.rm=TRUE)

# Daily zoo object
sfreq(d)

# Monthly zoo object
sfreq(m)

# Annual zoo object
sfreq(a)





