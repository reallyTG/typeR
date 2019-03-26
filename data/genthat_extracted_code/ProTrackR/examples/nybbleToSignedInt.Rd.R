library(ProTrackR)


### Name: nybbleToSignedInt
### Title: Get signed integer values from nybbles
### Aliases: nybbleToSignedInt

### ** Examples

## generate some raw data:

rdat <- as.raw(255*runif(100))

## get signed integers of low nybbles:

sintl <- nybbleToSignedInt(rdat)

## get signed integers of high nybbles:

sinth <- nybbleToSignedInt(rdat, "high")




