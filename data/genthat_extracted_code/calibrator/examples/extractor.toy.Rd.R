library(calibrator)


### Name: extractor.toy
### Title: Extracts lat/long matrix and theta matrix from D2.
### Aliases: extractor.toy
### Keywords: array

### ** Examples

data(toys)
extractor.toy(D1.toy)
extractor.toy(D1.toy[1,,drop=FALSE])
(jj <- extractor.toy(D1.fun(x.star=x.toy , t.vec=theta.toy)))
D1.fun(jj$x.star,jj$t.vec)




