library(ProTrackR)


### Name: PTCell-class
### Title: The PTCell class
### Aliases: PTCell-class PTCell

### ** Examples

data("mod.intro")

## get the PTCell from mod.intro at
## PTPattern #1, PTTrack #1 and row #1:

cell <- PTCell(mod.intro, 1, 1, 1)

## get the note of this cell:
note(cell)

## get the octave of this cell:
octave(cell)

## get the sampleNumber of this cell:
sampleNumber(cell)

## get the effect code of this cell:
effect(cell)

## get the raw data of this cell:
as.raw(cell)

## get the character representation of this cell:
as.character(cell)



