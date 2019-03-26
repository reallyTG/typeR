library(FeaLect)


### Name: train.doctor
### Title: Fits various models based on a combination on penalized linear
###   models and logistic regression.
### Aliases: train.doctor
### Keywords: regression multivariate classif models

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
message(dim(F)[1], " samples and ",dim(F)[2], " features.")

all.samples <- rownames(F); ts <- all.samples[5:10]; vs <- all.samples[c(1,22)]

doctor <- train.doctor(F_=F, L_=L, training.samples=ts, validating.samples=vs,
       considered.features=colnames(F), maximum.features.num=10)




