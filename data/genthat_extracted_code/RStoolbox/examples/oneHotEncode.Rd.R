library(RStoolbox)


### Name: oneHotEncode
### Title: One-hot encode a raster or vector
### Aliases: oneHotEncode

### ** Examples

library(raster)

## example data
data(rlogo)
sc <- unsuperClass(rlogo, nClasses = 3)

## one-hot encode 
sc_oneHot <- oneHotEncode(sc$map, classes = c(1,2,3))

## check results
sc_oneHot
plot(sc_oneHot)



