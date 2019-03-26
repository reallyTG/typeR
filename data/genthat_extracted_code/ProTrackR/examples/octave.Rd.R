library(ProTrackR)


### Name: octave
### Title: Extract or replace an octave
### Aliases: octave octave,numeric-method octave,PTCell-method octave<-
###   octave<-,PTCell,numeric-method

### ** Examples

data("mod.intro")

## get the octave number of PTCell at pattern #3, track #2,
## row #1 from mod.intro (which is number 3):

octave(PTCell(mod.intro, 1, 2, 3))

## replace the octave number of PTCell at pattern #3, track #2,
## row #1 from mod.intro with 2:

octave(PTCell(mod.intro, 1, 2, 3)) <- 2

## get the octave numbers associated with the period
## values 200 up to 400:

octave(200:400)



