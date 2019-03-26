library(soundgen)


### Name: getVocalFry
### Title: Subharmonics
### Aliases: getVocalFry
### Keywords: internal

### ** Examples

pitch_per_gc = c(400, 500, 600, 700)
rolloff = getRolloff(pitch_per_gc, rolloff = -30)
# one epoch, two subharmonics
rolloff_subh = soundgen:::getVocalFry(rolloff, pitch_per_gc,
  subFreq = 200, subDep = 150, shortestEpoch = 100)
# three epochs with 2/3/4 subharmonics
rolloff_subh = soundgen:::getVocalFry(rolloff, pitch_per_gc,
  subFreq = 200, subDep = 150, shortestEpoch = 0)



