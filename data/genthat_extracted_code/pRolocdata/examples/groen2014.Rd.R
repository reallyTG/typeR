library(pRolocdata)


### Name: groen2014
### Title: LOPIT experiments on Arabidopsis thaliana roots, from Groen et
###   al. (2014)
### Aliases: groen2014 groen2014r1 groen2014r2 groen2014r3 groen2014cmb
###   groen2014r1goCC
### Keywords: datasets

### ** Examples

data(groen2014r1)
data(groen2014r2)
data(groen2014r3)
data(groen2014cmb)

## The combine dataset can generated manually using 
cmb <- combine(groen2014r1, updateFvarLabels(groen2014r2))
cmb <- filterNA(cmb)
cmb <- combine(cmb, updateFvarLabels(groen2014r3))
cmb <- filterNA(cmb)
fData(cmb) <- fData(cmb)[, c(1,2,5)]
cmb

## or can simply be loaded directly
data(groen2014cmb)

## check datsets are the same
all.equal(cmb, groen2014cmb, check.attributes=FALSE)



