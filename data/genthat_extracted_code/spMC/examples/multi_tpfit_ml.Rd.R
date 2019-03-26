library(spMC)


### Name: multi_tpfit_ml
### Title: Mean Length Method for Multidimensional Model Parameters
###   Estimation
### Aliases: multi_tpfit_ml
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate transition rates matrices and 
# proportions for the categorical variable MAT5
multi_tpfit_ml(ACM$MAT5, ACM[, 1:3])

# Estimate transition rates matrices and
# proportions for the categorical variable MAT3
multi_tpfit_ml(ACM$MAT3, ACM[, 1:3])

# Estimate transition rates matrices and
# proportions for the categorical variable PERM
multi_tpfit_ml(ACM$PERM, ACM[, 1:3])
## End(No test)


