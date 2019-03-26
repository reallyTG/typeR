library(squash)


### Name: trianglegram
### Title: Draw a color-coded triangular matrix
### Aliases: trianglegram
### Keywords: aplot

### ** Examples
 
  m <- matrix(jet(40), nrow = 20, ncol = 20)
  trianglegram(m)

  ## just for fun
  trianglegram(m, labels = NA, right = TRUE, add = TRUE, xpos = 1)



