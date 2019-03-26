library(preseqR)


### Name: preseqR.interpolate.rSAC
### Title: Interpolation
### Aliases: preseqR.interpolate.rSAC
### Keywords: interpolation, r-SAC

### ** Examples

## load library
library(preseqR)

## import data
data(Shakespeare)

## The expected number of distinct words represented twice or more in the
## subsample 
preseqR.interpolate.rSAC(n=Shakespeare, ss=1e5, r=2)



