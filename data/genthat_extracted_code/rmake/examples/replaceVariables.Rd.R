library(rmake)


### Name: replaceVariables
### Title: Replace 'rmake' variables in a character vector
### Aliases: replaceVariables

### ** Examples

vars <- c(SIZE='small', METHOD='abc')
replaceVariables('result-$[SIZE]-$[METHOD].csv', vars)   # returns 'result-small-abc.csv'




