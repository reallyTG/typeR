library(zipfR)


### Name: spc.vector
### Title: Create Vector of Spectrum Elements (zipfR)
### Aliases: spc.vector
### Keywords: manip

### ** Examples


## Brown Noun spectrum
data(BrownNoun.spc)

## by default, extract first 15 elements
spc.vector(BrownNoun.spc)

## first five elements
spc.vector(BrownNoun.spc,1,5)

## just frequencies of spc elements 4 and 5 
spc.vector(BrownNoun.spc,4,5)
## same as
Vm(BrownNoun.spc,4:5)




