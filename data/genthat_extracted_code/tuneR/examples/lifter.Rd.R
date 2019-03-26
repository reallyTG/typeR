library(tuneR)


### Name: lifter
### Title: Liftering of cepstra
### Aliases: lifter

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  m <- melfcc(testsound, frames_in_rows=FALSE)
  unlm <- lifter(m, inv=TRUE)



