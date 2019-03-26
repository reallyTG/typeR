library(HCmodelSets)


### Name: ModelSelection.Phase
### Title: Construct sets of well-fitting models as proposed by Cox, D. R.
###   & Battey, H. S. (2017)
### Aliases: ModelSelection.Phase

### ** Examples

## No test: 
## Generates a random DGP
dgp = DGP(s=5, a=3, sigStrength=1, rho=0.9, n=100, intercept=5, noise=1,
          var=1, d=1000, DGP.seed = 2018)

#Reduction Phase using only the first 70 observations
outcome.Reduction.Phase =  Reduction.Phase(X=dgp$X[1:70,],Y=dgp$Y[1:70],
                                           family=gaussian, seed.HC = 1012)

# Exploratory Phase using only the first 70 observations, choosing the variables which
# were selected at least two times in the third dimension reduction

idxs = outcome.Reduction.Phase$List.Selection$`Hypercube with dim 2`$numSelected1
outcome.Exploratory.Phase =  Exploratory.Phase(X=dgp$X[1:70,],Y=dgp$Y[1:70],
                                               list.reduction = idxs,
                                               family=gaussian, signif=0.01)

# Model Selection Phase using only the remainer observations
sq.terms = outcome.Exploratory.Phase$mat.select.SQ
in.terms = outcome.Exploratory.Phase$mat.select.INTER

MS = ModelSelection.Phase(X=dgp$X[71:100,],Y=dgp$Y[71:100], list.reduction = idxs,
                          sq.terms = sq.terms,in.terms = in.terms, signif=0.01)
## End(No test)

## Don't show: 
dgp = DGP(s=5, a=3, sigStrength=1, rho=0.9, n=20, intercept=5, noise=1,
          var=1, d=50, DGP.seed = 2019)

#Reduction Phase using only the first 70 observations
outcome.Reduction.Phase =  Reduction.Phase(X=dgp$X[1:10,],Y=dgp$Y[1:10],
                                           dmHC = 2, family=gaussian, seed.HC = 1093)

# Exploratory Phase using only the first 70 observations, choosing the variables which
# were selected at least two times in the third dimension reduction

idxs = outcome.Reduction.Phase$List.Selection$`Hypercube with dim 2`$numSelected2
outcome.Exploratory.Phase =  Exploratory.Phase(X=dgp$X[1:10,],Y=dgp$Y[1:10],
                                               list.reduction = idxs,
                                               family=gaussian, signif=0.01)

# Model Selection Phase using only the remainer observations
sq.terms = outcome.Exploratory.Phase$mat.select.SQ
in.terms = outcome.Exploratory.Phase$mat.select.INTER

MS = ModelSelection.Phase(X=dgp$X[11:20,],Y=dgp$Y[11:20], list.reduction = idxs,
                          sq.terms = sq.terms,in.terms = in.terms, signif=0.01)
## End(Don't show)



