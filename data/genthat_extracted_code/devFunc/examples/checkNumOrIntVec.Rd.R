library(devFunc)


### Name: checkNumOrIntVec
### Title: Checking if all elements of a list are all integer or numeric
###   vectors
### Aliases: checkNumOrIntVec

### ** Examples

arg1 <- 1L
checkNumOrIntVec(list(arg1))

arg1 <- 1
checkNumOrIntVec(list(arg1))

## No test: 
checkNumOrIntVec(list(1L, TRUE, 2L))
checkNumOrIntVec(list(1L, TRUE, 2L), c('Var1', 'Var2', 'Var3'))

arg2 <- 'R'
checkNumOrIntVec(list(arg2))
checkNumOrIntVec(list(arg2, TRUE, 2))
## End(No test)



