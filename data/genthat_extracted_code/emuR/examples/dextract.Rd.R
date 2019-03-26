library(emuR)


### Name: dextract
### Title: Extract a subset of data from a trackdata object
### Aliases: dextract dextract.sub
### Keywords: datagen

### ** Examples


data(demo.vowels.f0)
data(demo.vowels.fm)

form = demo.vowels.fm
# get the formants at the midpoint: f50 is a matrix
# same as dcut(form, .5, prop=TRUE)
f50 = dextract(form, 0.5)
# get the formants between the 25% and 75% time points
# fcut is a trackdata object
# same as dcut(form, .25, .75, prop=TRUE)
fcut = dextract(form, 0.25, 0.75)
# get  F0 at the midpoint. fzero50 is a vector
# same as dcut(fzero, .5, prop=TRUE)
fzero = demo.vowels.f0
fzero50 = dextract(fzero, 0.5)





