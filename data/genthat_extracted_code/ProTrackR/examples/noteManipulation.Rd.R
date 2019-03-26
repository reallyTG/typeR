library(ProTrackR)


### Name: noteUp
### Title: Raise or lower notes and octaves
### Aliases: noteUp noteUp,PTCell-method noteDown noteDown,PTCell-method
###   octaveUp octaveUp,PTCell-method octaveDown octaveDown,PTCell-method
###   noteUp,PTTrack-method noteDown,PTTrack-method octaveUp,PTTrack-method
###   octaveDown,PTTrack-method noteUp,PTPattern-method
###   noteDown,PTPattern-method octaveUp,PTPattern-method
###   octaveDown,PTPattern-method

### ** Examples


## raise note from C-2 to C#2:
noteUp(PTCell("C-2 01 000"))


## lower note from C-2 to B-1:
noteDown(PTCell("C-2 01 000"))


## raise note from octave 2 to octave 3:
octaveUp(PTCell("C-2 01 000"))


## lower note from octave 2 to octave 1:
octaveDown(PTCell("C-2 01 000"))


data("mod.intro")

## Raise the notes of all cells in pattern
## number 2 of mod.intro:
noteUp(PTPattern(mod.intro, 2))

## Raise only the notes of sample number 4
## in pattern number 2 of mod.intro:
noteUp(PTPattern(mod.intro, 2), 4)

## Raise only the notes of samples number 2 and 4
## in pattern number 2 of mod.intro:
noteUp(PTPattern(mod.intro, 2), c(2, 4))




