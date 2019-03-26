library(HCmodelSets)


### Name: Reduction.Phase
### Title: Reduction by successive traversal of hypercubes proposed by Cox,
###   D. R. & Battey, H. S. (2017)
### Aliases: Reduction.Phase

### ** Examples

## No test: 
## Generates a random DGP
dgp = DGP(s=5, a=3, sigStrength=1, rho=0.9, n=100, intercept=5, noise=1,
          var=1, d=1000, DGP.seed = 2018)

#Reduction Phase using only the first 70 observations
outcome.Reduction.Phase =  Reduction.Phase(X=dgp$X[1:70,],Y=dgp$Y[1:70],
                                           family=gaussian, seed.HC = 1012)

# Not run, using vector.signif argument
# Fixing a decision rule of getting the 2 most significant in the first reduction
# and in the subsequent reduction, only those variables significant at 0.001 level
# outcome.Reduction.Phase =  Reduction.Phase(X=dgp$X[1:70,],Y=dgp$Y[1:70],
#                           vector.signif = c(2,0.001), family=gaussian, dmHC = 3)

## End(No test)
## Don't show: 
dgp = DGP(s=5, a=3, sigStrength=1, rho=0.9, n=20, intercept=5, noise=1,
          var=1, d=50, DGP.seed = 2019)

#Reduction Phase using only the first 70 observations
outcome.Reduction.Phase =  Reduction.Phase(X=dgp$X[1:10,],Y=dgp$Y[1:10],
                                           dmHC = 2, family=gaussian, seed.HC = 1093)
## End(Don't show)




