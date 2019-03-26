library(ProTrackR)


### Name: sampleNumber
### Title: Extract or replace a sample number
### Aliases: sampleNumber sampleNumber,PTCell-method sampleNumber<-
###   sampleNumber<-,PTCell,numeric-method

### ** Examples

data("mod.intro")

## get the sample index number of PTCell at pattern #3,
## track #2, row #1 from mod.intro (which is 2):

sampleNumber(PTCell(mod.intro, 1, 2, 3))

## replace the sample index number of PTCell at pattern #3,
## track #2, row #1 from mod.intro with 1:

sampleNumber(PTCell(mod.intro, 1, 2, 3)) <- 1



