library(devFunc)


### Name: checkLength
### Title: Checking if the length of the different elements of a list
###   corresponds to what one expects.
### Aliases: checkLength

### ** Examples

arg1 <- 'something'
checkLength(list(arg1), 1)

checkLength(list('somethingElse', TRUE), 1)
checkLength(list('somethingElse', TRUE), c(1, 1))

arg2 <- 2:5
checkLength(list(arg1, arg2), c(1, 4))
## No test: 
checkLength(list(arg1, arg2), 1)
## End(No test)



