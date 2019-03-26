library(FeaLect)


### Name: FeaLect
### Title: Computes the scores of the features.
### Aliases: FeaLect
### Keywords: regression multivariate classif models

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

## For this data, total.num.of.models is suggested to be at least 100.
FeaLect.result <-FeaLect(F=F,L=L,maximum.features.num=10,total.num.of.models=20,talk=TRUE)	




