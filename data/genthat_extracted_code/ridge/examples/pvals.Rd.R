library(ridge)


### Name: pvals
### Title: Compute p-values for ridgeLinear and ridgeLogistic models
### Aliases: pvals pvals.ridgeLinear pvals.ridgeLogistic
###   plot.pvalsRidgeLinear plot.pvalsRidgeLogistic print.pvalsRidgeLinear
###   print.pvalsRidgeLogistic

### ** Examples

data(GenBin)
mod <- logisticRidge(Phenotypes ~ ., data = as.data.frame(GenBin))
pvalsMod <- pvals(mod)
print(pvalsMod)
print(pvalsMod, all.coef = TRUE)
plot(pvalsMod)



