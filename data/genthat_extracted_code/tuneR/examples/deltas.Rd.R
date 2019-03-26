library(tuneR)


### Name: deltas
### Title: Calculate delta features
### Aliases: deltas

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  m <- melfcc(testsound, frames_in_rows=FALSE)
  d <- deltas(m)



