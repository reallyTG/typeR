library(emuR)


### Name: track.gradinfo
### Title: Calculate gradient summary information for trackdata
### Aliases: track.gradinfo
### Keywords: misc

### ** Examples


data(vowlax)
segs = vowlax
## fm has 4 columns
data.fm <-vowlax.fdat
## F0 has one
data.F0 <- vowlax.fund
## info.fm will have duration, 4xstart, 4xend, 4xdelta, 4xslope
info.fm <- track.gradinfo(data.fm)
## this should be true
ncol(info.fm) == 1+4+4+4+4

## info.F0 will have one of each
info.F0 <- track.gradinfo(data.F0)
## this should be true
ncol(info.F0) == 1+1+1+1+1

## plot the durations vs delta of the first formant
plot(info.F0$duration, info.fm$delta1, type="n", xlab="Duration", ylab="Delta")
text(info.fm$duration, info.fm$delta1, labels=label(segs))

## extract just the delta values from the formant info
## You need to eyeball the data to work out which columns to select
delta.fm <- info.fm[,10:13]




