library(FeaLect)


### Name: compute.balanced
### Title: Balances between negative and positive samples by oversampling.
### Aliases: compute.balanced
### Keywords: regression multivariate classif models

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(L)

balanced <- compute.balanced(F_=F, L_=L)
message(balanced$L_)




