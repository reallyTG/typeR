library(ProTrackR)


### Name: loopLength
### Title: The loop length of a PTSample
### Aliases: loopLength loopLength,PTSample-method loopLength<-
###   loopLength<-,PTSample-method

### ** Examples

data("mod.intro")

## get the loop length of the
## first sample of mod.intro:

loopLength(PTSample(mod.intro, 1))

## Let's change the length of
## the loop to 200

loopLength(PTSample(mod.intro, 1)) <- 200

## Let's turn off the loop all together:

loopLength(PTSample(mod.intro, 1)) <- FALSE




