library(ProTrackR)


### Name: patternOrderLength
### Title: Get the length of the pattern order table
### Aliases: patternOrderLength patternOrderLength,PTModule-method
###   patternOrderLength<- patternOrderLength<-,PTModule,numeric-method

### ** Examples

data("mod.intro")

## get the length of the pattern order table:
patternOrderLength(mod.intro)

## set the length of the pattern order table to 1:
patternOrderLength(mod.intro) <- 1

## note that the pattern order table remained intact:
patternOrder(mod.intro, full = TRUE)




