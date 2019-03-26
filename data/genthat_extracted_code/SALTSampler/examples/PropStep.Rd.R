library(SALTSampler)


### Name: PropStep
### Title: Draw a Proposal on a Simplex
### Aliases: PropStep

### ** Examples

  #Propose new step from y = c(0.2, 0.3, 0.5)
  y <- c(0.2, 0.3, 0.5)
  PropStep(y = Logit(y), i = 1, h = c(2, 2, 2))



