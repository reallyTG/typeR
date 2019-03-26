library(ProTrackR)


### Name: PTPattern-method
### Title: Coerce to or replace PTPattern
### Aliases: PTPattern-method PTPattern,raw,missing-method
###   PTPattern,matrix,missing-method PTPattern,PTModule,numeric-method
###   PTPattern<- PTPattern<-,PTModule,numeric,PTPattern-method

### ** Examples

## This will create an 'empty' PTPattern with
## all 0x00 values, which is equivalent to
## new("PTPattern"):
PTPattern(as.raw(0x00))

## Create a PTPattern based on repeated
## PTCell character representations:
pat <- PTPattern(matrix("F#2 1A 20A", 64, 4))

data("mod.intro")

## Replace the first pattern in the patternOrder
## table in mod.intro with 'pat' (don't forget to
## add one (+1) to the index):
PTPattern(mod.intro,
          patternOrder(mod.intro)[1] + 1) <- pat



