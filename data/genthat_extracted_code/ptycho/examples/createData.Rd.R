library(ptycho)


### Name: createData
### Title: Simulate Data
### Aliases: createData createDataBayesModel createPubData

### ** Examples

### EXAMPLE 1
data(tinysim)
# Data generated with mode equal to pleiotropy, so indic.grp exists and
# has an entry for each column in X.
colnames(tinysim$X)
tinysim$replicates[[5]]$indic.grp
# X4, X6, and X9 are associated with some responses.
tinysim$replicates[[5]]$indic.var

### EXAMPLE 2
# Generate miniature data set with information shared across covariates.
set.seed(1234)
tiny1 <- createDataBayesModel(mode="gene", n=100, p=10, q=5, nreps=10,
                              tau.min=0.045, tau.max=0.063, G=2)
# A covariate can only have indic.var=1 if the group it belongs to has
# indic.grp=1.  For example,indic.grp[1,4]=0 implies
# indic.var[groups$group2var[1],4]=0.
tiny1$replicates[[1]]$indic.grp
tiny1$omega[[2]]$groups$group2var[1]
tiny1$replicates[[1]]$indic.var

### EXAMPLE 3
# Alternatively, call createData directly
groups <- createGroupsSim(G=2, p=10)
omegaargs <- list(indic.grp.shape1=16, indic.grp.shape2=55,
                  shape1=48, shape2=12, groups=groups)
betaargs <- list(tau.min=0.045, tau.max=0.063)
set.seed(1234)
tiny2 <- createData(X=list("createOrthogonalX", list(n=100, p=10)),
                    y=list(nreps=10, q=5, sd=1),
                    omega=list("createOmegaCrossVars", omegaargs),
                    beta=list("createBetaNormal", betaargs))
identical(tiny1, tiny2)
### SEE THE CODE FOR createPubData FOR MORE EXAMPLES.



