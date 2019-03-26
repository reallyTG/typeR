library(phyclust)


### Name: bootstrap.seq
### Title: Bootstrap Sequences from a Fitted Model and Star Tree.
### Aliases: bootstrap.seq
### Keywords: bootstrap

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D EMC.1 <- .EMC
##D EMC.1$EM.iter <- 1
##D # the same as EMC.1 <- .EMControl(EM.iter = 1)
##D 
##D ret.1 <- phyclust(seq.data.toy$org, 2, EMC = EMC.1)
##D ret.tree <- bootstrap.star.trees(ret.1)
##D ret.seq <- bootstrap.seq(ret.1, ret.tree)
## End(Not run)



