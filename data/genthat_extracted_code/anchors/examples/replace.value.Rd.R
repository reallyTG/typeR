library(anchors)


### Name: replace.value
### Title: Replaces occurences of a value with another value in set of
###   columns
### Aliases: replace.value
### Keywords: manip

### ** Examples

## data with zeroes as missing values in responses
data(poleff)
## data with NA missing values in responses
data(poleffna)

## convert NA to 0:
dd  <- replace.value(poleffna,c("xsayself","xsay1","xsay2","xsay3","xsay4","xsay5"))

## convert 0 to NA:
dd2 <- replace.value(poleff,c("xsayself","xsay1","xsay2","xsay3","xsay4","xsay5"),0,as.double(NA))




