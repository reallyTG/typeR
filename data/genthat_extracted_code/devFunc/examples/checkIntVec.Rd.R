library(devFunc)


### Name: checkIntVec
### Title: Checking if all elements of a list are all integer vectors
### Aliases: checkIntVec

### ** Examples

arg1 <- 1L
checkIntVec(list(arg1))

## No test: 
checkIntVec(list(1L, TRUE, 2L))

arg2 <- 'R'
checkIntVec(list(arg2))
checkIntVec(list(arg2, TRUE, 2))
## End(No test)



