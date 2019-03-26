library(FeaLect)


### Name: compute.logistic.score
### Title: Fits a logistic regression model using the linear scores
### Aliases: compute.logistic.score
### Keywords: regression multivariate classif models

### ** Examples

library(FeaLect)
data(mcl_sll)
F <- as.matrix(mcl_sll[ ,-1])	# The Feature matrix
L <- as.numeric(mcl_sll[ ,1])	# The labels
names(L) <- rownames(F)
all.samples <- rownames(F); ts <- all.samples[5:10]; vs <- all.samples[c(1,22)]
L <- L[c(ts,vs)]
L

asymptotic.scores <- c(1,0.9,0.8,0.2,0.1,0.1,0.7,0.2)

compute.logistic.score(F_=F, L_=L, training.samples=ts, validating.samples=vs, 
			     considered.features=colnames(F),linear.scores= asymptotic.scores)




