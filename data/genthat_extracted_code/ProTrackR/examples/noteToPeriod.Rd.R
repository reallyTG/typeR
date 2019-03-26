library(ProTrackR)


### Name: noteToPeriod
### Title: Extract period value for a specific note
### Aliases: noteToPeriod

### ** Examples

## Determine the period value corresponding with note 'A-3':
noteToPeriod("A-3")

## get the period values for notes 'A-3' and 'A#3' with finetune at -1:
noteToPeriod(c("A-3", "A#3"), -1)

## get the period values for note 'A-3' with finetune at 0 and 1:
noteToPeriod("A-3", 0:1)




