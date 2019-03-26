library(FeaLect)


### Name: random.subset
### Title: Selects a random subset of the input.
### Aliases: random.subset
### Keywords: regression multivariate classif models

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

XY <- random.subset(F_=F, L_=L, gamma=3/4,replace=TRUE)
XY$remainder.samples




