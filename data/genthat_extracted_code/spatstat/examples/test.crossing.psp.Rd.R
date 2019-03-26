library(spatstat)


### Name: test.crossing.psp
### Title: Check Whether Segments Cross
### Aliases: test.crossing.psp test.selfcrossing.psp
### Keywords: spatial math

### ** Examples

  B <- edges(letterR)
  A <- rpoisline(5, Frame(B))
  MA <- test.selfcrossing.psp(A)
  MAB <- test.crossing.psp(A, B)



