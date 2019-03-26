library(FeaLect)


### Name: input.check.FeaLect
### Title: Checks the inputs to Fealect() function.
### Aliases: input.check.FeaLect
### Keywords: regression multivariate classif models error misc debugging

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)

checked <- input.check.FeaLect(F_=F, L_=L, maximum.features.num=10, gamma=3/4)




