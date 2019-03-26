library(devFunc)


### Name: checkCharVec
### Title: Checking if all elements of a list are all character vectors
### Aliases: checkCharVec

### ** Examples

arg1 <- 'something'
checkCharVec(list(arg1))

## No test: 
checkCharVec(list('somethingElse', TRUE))

arg2 <- 2
checkCharVec(list(arg2))
checkCharVec(list(arg2, TRUE, 5L))
## End(No test)



