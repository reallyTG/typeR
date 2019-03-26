library(soundgen)


### Name: HzToSemitones
### Title: Convert Hz to semitones
### Aliases: HzToSemitones

### ** Examples

s = HzToSemitones(c(440, 293, 115))
# to convert to musical notation
notesDict$note[1 + round(s)]
# note the "1 +": semitones ABOVE C-5, i.e. notesDict[1, ] is C-5



