library(sp)


### Name: char2dms
### Title: Convert character vector to DMS-class object
### Aliases: char2dms dd2dms coerce,DMS,numeric-method
###   coerce,DMS,character-method as.character.DMS
### Keywords: spatial

### ** Examples

data(state)
str(state.center$y)
stateN <- dd2dms(state.center$y, NS=TRUE)
str(attributes(stateN))
ch.stateN <- as.character(stateN)
str(ch.stateN)
stateNa <- char2dms(ch.stateN)
str(attributes(stateNa))
ch.stateN <- as(stateN, "character")
str(ch.stateN)
stateNa <- char2dms(ch.stateN)
str(attributes(stateNa))



