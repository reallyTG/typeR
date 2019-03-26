library(ProTrackR)


### Name: note
### Title: Extract or replace a note
### Aliases: note note,numeric-method note,PTCell-method note<-
###   note<-,PTCell,character-method

### ** Examples

data("mod.intro")

## get the note of PTCell at pattern #3, track #2,
## row #1 from mod.intro (which is note "C-"):

note(PTCell(mod.intro, 1, 2, 3))

## replace the note of PTCell at pattern #3, track #2,
## row #1 from mod.intro with "A-":

note(PTCell(mod.intro, 1, 2, 3)) <- "A-"

## get the notes associated with the period
## values 200 up to 400:

note(200:400)




