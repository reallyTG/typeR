library(genasis)


### Name: genhistogram
### Title: genhistogram
### Aliases: genhistogram
### Keywords: genhistogram

### ** Examples

## Vector input.
genhistogram(rnorm(60))
  
## Use of example data from the package:
data(kosetice.pas.openair)
genhistogram(kosetice.pas.openair[,1:8],col="orange",emboss=3)
data(kosetice.pas.genasis)
genhistogram(kosetice.pas.genasis[1:208,],input="genasis",
             distr="lnorm",col="orange",emboss=2)



