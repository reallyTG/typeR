library(devFunc)


### Name: checkNumVec
### Title: Checking if all elements of a list are all numeric vectors
### Aliases: checkNumVec

### ** Examples

arg1 <- 2
checkNumVec(list(arg1))

## No test: 
checkNumVec(list(TRUE, T, 2))
checkNumVec(list(TRUE, T, 2), c('Var1', 'Var2', 'Var3'))

arg2 <- 0.8
checkNumVec(list(arg2))
checkNumVec(list(arg2, 'T', 2))
## End(No test)



