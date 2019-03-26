library(diffpriv)


### Name: DPMechExponential-class
### Title: An S4 class for the exponential mechanism of differential
###   privacy.
### Aliases: DPMechExponential-class DPMechExponential
###   show,DPMechExponential-method
###   releaseResponse,DPMechExponential,DPParamsEps-method
###   sensitivityNorm,DPMechExponential-method

### ** Examples

## Sensitive data are strings of length at most 5.
## Task is to release most frequent character present, hence quality function
## is a closure that counts character frequencies for given candidate char.
## Global sensitivity is max string length.
qualF <- function(X) { function(r) sum(r == unlist(strsplit(X, ""))) }
rs <- as.list(letters)
m <- DPMechExponential(sensitivity = 5, target = qualF, responseSet = rs)
X <- strsplit("the quick brown fox jumps over the lazy dog"," ")[[1]]
p <- DPParamsEps(epsilon = 1)
releaseResponse(m, p, X)



