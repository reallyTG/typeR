library(phyclust)


### Name: prune.Mu
### Title: Prune the Center Sequences Mu
### Aliases: prune.Mu
### Keywords: programming

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D X <- seq.data.toy$org
##D X[, 5] <- .nucleotide$nid[.nucleotide$code == "-"]
##D ret <- phyclust(X, 2)
##D Mu.GAPs <- prune.Mu(X, ret$class.id, ret$Mu)
##D 
##D ret$Mu[, 5]
##D Mu.GAPs[, 5]  # Replace by GAPs.
## End(Not run)



