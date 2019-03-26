library(indirect)


### Name: muSigma
### Title: Function to estimate mean and covariance for unknown parameters
###   beta.
### Aliases: muSigma

### ** Examples

X <- matrix(c(1, 1, 0, 1), nrow = 2) # design
Z <- designLink(design = X)
Z <- elicitPt(Z, design.pt = 1,
  lower.CI.bound = -1,
  median = 0,
  upper.CI.bound = 1,
  comment = "The first completed elicitation scenario.")
Z <- elicitPt(Z, design.pt = 2,
  lower.CI.bound = -2,
  median = 1,
  upper.CI.bound = 2,
  comment = "The second completed elicitation scenario.")
prior <- muSigma(Z, X, fit.method = "KL")
prior$mu
prior$Sigma   



