library(integIRTy)


### Name: fitOnSinglePlat
### Title: Fit IRT model on a single platform
### Aliases: fitOnSinglePlat
### Keywords: ~kwd1 ~kwd2

### ** Examples

# number of items and number of genes
nSample <- 10
nGene <- 2000
set.seed(1000)
a <- rgamma(nSample, shape=1, scale=1)
b <- rgamma(nSample, shape=1, scale=1)
# true latent traits
theta <- rnorm(nGene, mean=0)

# probability of correct response (P_ij) for gene i in sample j
P <- matrix(NA, nrow=nGene, ncol=nSample)
for(i in 1:nSample){
	P[, i] <- exp(a[i]*(theta-b[i]))/(1+exp(a[i]*(theta-b[i])))
}
# binary matrix
X <- matrix(NA, nrow=nGene, ncol=nSample)
for(i in 1:nSample){
	X[, i] <- rbinom(nGene, size=1, prob=P[, i])
}
# IRT fitting
fit2PL <- fitOnSinglePlat(X, model=3)



