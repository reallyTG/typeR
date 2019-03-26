library(caper)


### Name: pgls-methods
### Title: Generic model methods for 'pgls' models.
### Aliases: coef.pgls residuals.pgls fitted.pgls predict.pgls print.pgls
###   summary.pgls print.summary.pgls nobs.pgls
### Keywords: utils stats

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)
mod1 <- pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), shorebird) 
print(mod1)

mod1.sum <- summary(mod1)
print(mod1.sum)



