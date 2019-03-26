library(motmot.2.0)


### Name: transformPhylo.ll
### Title: Log-likelhood for models of trait evolution.
### Aliases: transformPhylo.ll

### ** Examples

# Data and phylogeny
data(anolis.tree)
data(anolis.data)

# anolis.data is not matrix and contains missing data so put together matrix of
# relevant traits (here female and male snout vent lengths) and remove species 
# with missing data from the matrix and phylogeny
anolisSVL <- data.matrix(anolis.data)[,c(5,6)]
anolisSVL[,1] <- log(anolisSVL[,1])
anolisSVL[,2] <- log(anolisSVL[,2])

tree <- drop.tip(anolis.tree, names(attr(na.omit(anolisSVL), "na.action")))
anolisSVL <- na.omit(anolisSVL)

# log likelihood of kappa = 0.1 or 1
transformPhylo.ll(anolisSVL, phy=tree, model="kappa", kappa=0.1)
transformPhylo.ll(anolisSVL, phy=tree, model="kappa", kappa=1)

# log likelihood of lambda = 0.01 or 1
transformPhylo.ll(anolisSVL, phy=tree, model="lambda", lambda=0.01)
transformPhylo.ll(anolisSVL, phy=tree, model="lambda", lambda=1)

# log likelihood of delta = 1.5 or 1
transformPhylo.ll(anolisSVL, phy=tree, model="delta", delta=1.5)
transformPhylo.ll(anolisSVL, phy=tree, model="delta", delta=1)

# log likelihood of alpha = 0.001 or 2
transformPhylo.ll(anolisSVL, phy=tree, model="OU", alpha=0.001)
transformPhylo.ll(anolisSVL, phy=tree, model="OU", alpha=2)

# log likelihood of psi = 0 (gradual) or 1 (speciational)
phy.bd <- birthdeath(tree)
mu_over_lambda <- phy.bd[[4]][1]
lambda_minus_mu <- phy.bd[[4]][2]
lambda.sp <- as.numeric(lambda_minus_mu / (1 - mu_over_lambda))
transformPhylo.ll(anolisSVL, phy=tree, model="psi", psi=0, lambda.sp=lambda.sp)
transformPhylo.ll(anolisSVL, phy=tree, model="psi", psi=1, lambda.sp=lambda.sp)



