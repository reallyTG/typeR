library(baytrends)


### Name: isCharLike
### Title: Test whether an object can be treated in a particular way
### Aliases: isCharLike isDateLike isGroupLike isNumberLike isDateLike
###   isGroupLike isNumberLike
### Keywords: internal manip

### ** Examples


## The first should be FALSE and the second TRUE
isCharLike(as.Date("2004-12-31"))
isCharLike("32")

## The first should be FALSE and the second TRUE
isDateLike(32)
isDateLike(as.Date("2004-12-31"))

## The first should be FALSE and the second TRUE
isGroupLike(as.Date("2004-12-31"))
isGroupLike(32)

## The first should be FALSE and the second TRUE
isNumberLike(as.Date("2004-12-31"))
isNumberLike(32)



