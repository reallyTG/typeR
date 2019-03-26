library(FeaLect)


### Name: ignore.redundant
### Title: Refines a feature matrix
### Aliases: ignore.redundant
### Keywords: regression multivariate classif models

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
#F <- cbind(F, rep(1, times=dim(F)[1]))
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

G <- ignore.redundant(F)
message("for ",dim(G)[1], " samples, ",dim(G)[2], " features are left.")




