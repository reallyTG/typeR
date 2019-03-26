library(ProTrackR)


### Name: PTTrack-method
### Title: Coerce to or replace PTTrack
### Aliases: PTTrack-method PTTrack,raw,missing,missing-method
###   PTTrack,matrix,missing,missing-method
###   PTTrack,character,missing,missing-method
###   PTTrack,PTModule,numeric,numeric-method PTTrack<-
###   PTTrack<-,PTModule,numeric,numeric,PTTrack-method
###   PTTrack,PTPattern,numeric,missing-method
###   PTTrack,numeric,missing-method
###   PTTrack<-,PTPattern,numeric,missing,PTTrack-method
###   PTTrack<-,numeric,missing,PTTrack-method

### ** Examples

## This will create an 'empty' PTTrack with all nul
## values, which is equivalent to new("PTTrack"):
PTTrack(as.raw(0x00))

## This will generate a PTTrack from a repeated
## character representation of a PTCell:
chan <- PTTrack(rep("C-3 01 C20", 64))

data("mod.intro")

## This will replace the PTTrack at pattern
## number 1, track number 2 of mod.intro with chan:
PTTrack(mod.intro, 2, 1) <- chan




