library(penalized)


### Name: Cross-validation in penalized generalized linear models
### Title: Cross-validated penalized regression
### Aliases: cvl profL1 profL2 optL1 optL2
### Keywords: multivariate regression

### ** Examples

# More examples in the package vignette:
#  type vignette("penalized")

data(nki70)
attach(nki70)

# Finding an optimal cross-validated likelihood
opt <- optL1(Surv(time, event), penalized = nki70[,8:77], fold = 5)
coefficients(opt$fullfit)
plot(opt$predictions)

# Plotting the profile of the cross-validated likelihood
prof <- profL1(Surv(time, event), penalized = nki70[,8:77],
    fold = opt$fold, steps=10)
plot(prof$lambda, prof$cvl, type="l")
plotpath(prof$fullfit)



