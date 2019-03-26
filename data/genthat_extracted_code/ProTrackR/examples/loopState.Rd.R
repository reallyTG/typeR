library(ProTrackR)


### Name: loopState
### Title: Get PTSample loop state
### Aliases: loopState loopState,PTSample-method

### ** Examples

data("mod.intro")

## Get the loop status of sample number 1
## (it has a loop):
loopState(PTSample(mod.intro, 1))

## Get the loop status of sample number 2
## (it has no loop):
loopState(PTSample(mod.intro, 2))



