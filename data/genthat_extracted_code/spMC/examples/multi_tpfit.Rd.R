library(spMC)


### Name: multi_tpfit
### Title: Multidimensional Model Parameters Estimation
### Aliases: multi_tpfit
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)

# Estimate transition rates matrices and 
# proportions for the categorical variable MAT5
multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Estimate transition rates matrices and
# proportions for the categorical variable MAT3
multi_tpfit(ACM$MAT3, ACM[, 1:3])

# Estimate transition rates matrices and
# proportions for the categorical variable PERM
multi_tpfit(ACM$PERM, ACM[, 1:3])
## End(No test)


