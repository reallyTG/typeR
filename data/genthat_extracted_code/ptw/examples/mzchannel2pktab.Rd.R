library(ptw)


### Name: mzchannel2pktab
### Title: Conversion between peak lists from hyphenated MS (LCMS, GCMS,
###   ...) data and input for 'stptw'.
### Aliases: mzchannel2pktab pktab2mzchannel
### Keywords: manip

### ** Examples

data(lcms)
## first couple of peaks in the first three channels
(smallset <- lapply(lcms.pks[[1]][1:3], head))
## all in one data matrix
allpeaks <- mzchannel2pktab(smallset)
## and back again
pktab2mzchannel(allpeaks, Ivalue = "I")



