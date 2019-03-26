library(caper)


### Name: plot.pgls
### Title: Diagnostic plots for 'pgls' models.
### Aliases: plot.pgls
### Keywords: utils graphics

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)
mod1 <- pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), shorebird)
par(mfrow=c(2,2))
plot(mod1)



