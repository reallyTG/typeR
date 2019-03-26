library(caper)


### Name: pgls.profile
### Title: Likelihood profiles and confidence intervals for 'pgls' models.
### Aliases: pgls.profile plot.pgls.profile pgls.confint
### Keywords: util stats

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)
mod <- pgls(log(Egg.Mass) ~ log(M.Mass), shorebird, lambda='ML')
mod.l <- pgls.profile(mod, 'lambda')
plot(mod.l)
pgls.confint(mod, 'lambda')




