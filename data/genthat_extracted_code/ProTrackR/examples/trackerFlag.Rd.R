library(ProTrackR)


### Name: trackerFlag
### Title: Tracker flag indicating version compatibility
### Aliases: trackerFlag trackerFlag,PTModule-method trackerFlag<-
###   trackerFlag<-,PTModule-method

### ** Examples

data("mod.intro")

## the current trackerFlag of mod.intro is "M.K.",
## meaning that it can hold a maximum of 64 patterns:
trackerFlag(mod.intro)

patternOrder(mod.intro, full = TRUE) <- 0:63

## If we upgrade the trackerFlag of mod.intro to "M!K!"
## it can hold a maximum of 100 patterns!:
trackerFlag(mod.intro) <- "M!K!"

patternOrder(mod.intro, full = TRUE) <- 0:99

## Now let's do something dangerous:
## current flag is "M!K!", by setting it
## back to "M.K.", patterns 65:100 are lost...
trackerFlag(mod.intro) <- "M.K."




