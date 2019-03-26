library(FeaLect)


### Name: mcl_sll
### Title: MCL and SLL lymphoma subtypes
### Aliases: mcl_sll
### Keywords: datasets

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(dim(F)[1], " samples and ",dim(F)[2], " features.")
L




