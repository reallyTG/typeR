library(indirect)


### Name: pdist
### Title: Helper function that gives the probability distribution function
###   for design point.
### Aliases: pdist

### ** Examples

# design matrix: two scenarios
X <- matrix(c(1, 1, 0, 1), nrow = 2) 
rownames(X) <- c("scenario1", "scenario2")
colnames(X) <- c("covariate1", "covariate2")
#' # logit link
# central credible intervals with probability = 1/2
Z <- designLink(design = X, link = "logit", CI.prob = 0.5)
#' # lower and upper quartiles and median
Z <- indirect::elicitPt(Z, design.pt = 1, 
  lower.CI.bound = 0.2,
  median = 0.4,
  upper.CI.bound = 0.6,
  comment = "Completed.")
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = TRUE, fitted.curve = TRUE)
  
# probability that target is below 0.1 and
# probability that target is below 0.9   
indirect::pdist(c(0.1, 0.9), Z, design.pt = 1)



