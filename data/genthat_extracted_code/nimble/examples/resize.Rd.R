library(nimble)


### Name: resize
### Title: Resizes a modelValues object
### Aliases: resize

### ** Examples

mvConf <- modelValuesConf(vars = c('a', 'b'),
             types = c('double', 'double'),
             sizes = list(a = 1, b = c(2,2) ) ) 
mv <- modelValues(mvConf)
as.matrix(mv)
resize(mv, 3)
as.matrix(mv)




