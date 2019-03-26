library(taRifx)


### Name: sides
### Title: Figure out how many "sides" a formula has See also SimonO101's
###   answer at http://stackoverflow.com/a/16376939/636656
### Aliases: sides sides.default sides.formula

### ** Examples

test <- list( ~ a + b, a ~ b + c, b + c ~ a, ~ a ~ b, a ~ b ~ c, a~b+c|d~c~d~e~f~g )
sapply(test,sides)



