library(devFunc)


### Name: checkLogicVec
### Title: Checking if all elements of a list are all logical vectors
### Aliases: checkLogicVec

### ** Examples

arg1 <- TRUE
checkLogicVec(list(arg1))

## No test: 
checkLogicVec(list(TRUE, T, 2))
checkLogicVec(list(TRUE, T, 2), c('Var1', 'Var2', 'Var3'))

arg2 <- 0.8
checkLogicVec(list(arg2))
checkLogicVec(list(arg2, 'T', 2))
## End(No test)



