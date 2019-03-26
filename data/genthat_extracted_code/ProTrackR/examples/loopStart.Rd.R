library(ProTrackR)


### Name: loopStart
### Title: The loop start position of a PTSample
### Aliases: loopStart loopStart,PTSample-method loopStart<-
###   loopStart<-,PTSample-method

### ** Examples

data("mod.intro")

## get the loop start position of the
## first sample of mod.intro:

loopStart(PTSample(mod.intro, 1))

## Let's change the starting position of
## the loop to 500

loopStart(PTSample(mod.intro, 1)) <- 500

## Let's turn off the loop all together:

loopStart(PTSample(mod.intro, 1)) <- FALSE




