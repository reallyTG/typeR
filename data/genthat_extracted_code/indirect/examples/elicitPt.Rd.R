library(indirect)


### Name: elicitPt
### Title: Function to create or update elicitation at a given design
###   point.
### Aliases: elicitPt

### ** Examples

X <- matrix(c(1, 1, 0, 1), nrow = 2) # design
Z <- designLink(design = X)
Z <- elicitPt(Z, design.pt = 1,
  lower.CI.bound = -1,
  median = 0,
  upper.CI.bound = 1,
  comment = "A completed elicitation scenario.")



