library(ProTrackR)


### Name: as.raw
### Title: Extract and replace raw data
### Aliases: as.raw as.raw,PTCell-method as.raw<-
###   as.raw<-,PTCell,raw-method as.raw,PTTrack-method
###   as.raw<-,PTTrack,matrix-method as.raw,PTPattern-method
###   as.raw<-,PTPattern,matrix-method

### ** Examples

data("mod.intro")

## Get the raw data of the PTCell at
## pattern #1, track #1 and row #1
## of mod.intro:
as.raw(PTCell(mod.intro, 1, 1, 1))

## idem for PTTrack #1 of pattern #1:
as.raw(PTTrack(mod.intro, 1, 1))

## idem for PTPattern #1:
as.raw(PTPattern(mod.intro, 1))

## replace raw data of PTCell 1, 1, 1
## with that of PTCell 2, 1, 1:
as.raw(PTCell(mod.intro, 1, 1, 1)) <-
  as.raw(PTCell(mod.intro, 2, 1, 1))




