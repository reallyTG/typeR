library(nimble)


### Name: getsize
### Title: Returns number of rows of modelValues
### Aliases: getsize

### ** Examples

mvConf <- modelValuesConf(vars = 'a', types = 'double', sizes = list(a = 1) )
mv <- modelValues(mvConf)
 resize(mv, 10)
getsize(mv)



