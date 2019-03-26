library(bayesm)


### Name: mnpProb
### Title: Compute MNP Probabilities
### Aliases: mnpProb
### Keywords: models

### ** Examples

## example of computing MNP probabilites
## here Xa has the prices of each of the 3 alternatives

Xa    = matrix(c(1,.5,1.5), nrow=1)
X     = createX(p=3, na=1, nd=NULL, Xa=Xa, Xd=NULL, DIFF=TRUE)
beta  = c(1,-1,-2)  ## beta contains two intercepts and the price coefficient
Sigma = matrix(c(1, 0.5, 0.5, 1), ncol=2)

mnpProb(beta, Sigma, X)



