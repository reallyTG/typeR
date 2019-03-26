library(ProTrackR)


### Name: PTTrack-class
### Title: The PTTrack class
### Aliases: PTTrack-class PTTrack

### ** Examples

data("mod.intro")

## Get track number 2 from pattern
## number 1 of mod.intro:
chan1 <- PTTrack(mod.intro, 2, 1)

## Create a blank track:
chan2 <- new("PTTrack")

## Get two more tracks:
chan3 <- PTTrack(mod.intro, 1, 2)
chan4 <- PTTrack(mod.intro, 4, 3)

## combine the four tracks in a
## new PTPattern:
patt <- PTPattern(cbind(
  as.character(chan1),
  as.character(chan2),
  as.character(chan3),
  as.character(chan4)
))



