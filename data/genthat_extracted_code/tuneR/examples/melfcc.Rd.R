library(tuneR)


### Name: melfcc
### Title: MFCC Calculation
### Aliases: melfcc
### Keywords: ts

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  m1 <- melfcc(testsound)

  #Use PLP features to calculate cepstra and output the matrices like the
  #original Matlab code (note: modelorder limits the number of cepstra)
  m2 <- melfcc(testsound, numcep=9, usecmp=TRUE, modelorder=8, 
    spec_out=TRUE, frames_in_rows=FALSE)



