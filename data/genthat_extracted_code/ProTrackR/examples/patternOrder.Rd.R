library(ProTrackR)


### Name: patternOrder
### Title: Get the pattern order table
### Aliases: patternOrder patternOrder,PTModule-method patternOrder<-
###   patternOrder<-,PTModule,ANY,numeric-method

### ** Examples

data("mod.intro")

## get the visible part of the patternOrder table:
patternOrder(mod.intro)

## get the full patternOrder table:
patternOrder(mod.intro, full = TRUE)

## add 1 to get extract the right PTPattern from
## mod.intro:
first.pattern.played <-
  (PTPattern(mod.intro, patternOrder(mod.intro)[1] + 1))

## set a different playing order:
patternOrder(mod.intro) <- c(0:3, 0:3, 0:3)

## The assignment above uses a value that
## longer than the patternOrderLength.
## This means that a part ends up in the
## 'invisible' part of the order table:
patternOrder(mod.intro)
patternOrder(mod.intro, full = TRUE)

## Let's do the same assignment, but update
## the visible part of the table as well:
patternOrder(mod.intro, full = TRUE) <- c(0:3, 0:3, 0:3)

## note that the maximum of the order table plus 1
## equals the patternLength of mod.intro (always the case
## for a valid PTModule object):
max(patternOrder(mod.intro, full = TRUE) + 1) ==
  patternLength(mod.intro)

## Let's do something dangerous. If the replacement
## indices do not hold a maximum value that equals
## the patternLength minus 1, PTPatterns will get lost,
## in order to maintain the validity of mod.intro:
patternOrder(mod.intro) <- rep(0, 12)




