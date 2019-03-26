library(indirect)


### Name: plotDesignPoint
### Title: Plot elicited data, fitted marginals or model output
### Aliases: plotDesignPoint

### ** Examples

# design matrix: two scenarios
X <- matrix(c(1, 1, 0, 1), nrow = 2) 
rownames(X) <- c("scenario1", "scenario2")
colnames(X) <- c("covariate1", "covariate2")

# logit link
# central credible intervals with probability = 1/2
Z <- designLink(design = X, link = "logit", CI.prob = 0.5)

# 1st design point
# no elicited fractiles
indirect::plotDesignPoint(Z, design.pt = 1) 
# elicited median
Z <- indirect::elicitPt(Z, design.pt = 1, 
  lower.CI.bound = NA,
  median = 0.4,
  upper.CI.bound = NA,
  CI.prob = NULL)
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1))
# lower and upper quartiles and median
Z <- indirect::elicitPt(Z, design.pt = 1, 
  lower.CI.bound = 0.2,
  median = 0.4,
  upper.CI.bound = 0.6,
  comment = "Completed.")
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = TRUE, fitted.curve = TRUE)
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = c(1/10, 1/4, 1/2, 3/4, 9/10), 
  fitted.curve = TRUE)   
  
# second design point   
# central credible intervals with probability = 1/3 
# elicit upper and lower tertiles
Z <- elicitPt(Z, design.pt = 2,
  lower.CI.bound = 0.1,
  upper.CI.bound = 0.3,
  CI.prob = 1/3,
  comment = "Switched to tertiles.")
indirect::plotDesignPoint(Z, design.pt = 2,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1))   
indirect::plotDesignPoint(Z, design.pt = 2,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = TRUE, fitted.curve = TRUE)
indirect::plotDesignPoint(Z, design.pt = 2,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = c(1/10, 1/3, 1/2, 2/3, 9/10), 
  fitted.curve = TRUE) 



