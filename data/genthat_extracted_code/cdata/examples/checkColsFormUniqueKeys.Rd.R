library(cdata)


### Name: checkColsFormUniqueKeys
### Title: Check that a set of columns form unique keys.
### Aliases: checkColsFormUniqueKeys

### ** Examples


d <- data.frame(key = c('a','a', 'b'), k2 = c(1 ,2, 2))
checkColsFormUniqueKeys(d, 'key') # should be FALSE
checkColsFormUniqueKeys(d, c('key', 'k2')) # should be TRUE




