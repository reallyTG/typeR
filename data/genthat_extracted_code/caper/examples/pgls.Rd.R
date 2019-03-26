library(caper)


### Name: pgls
### Title: Phylogenetic generalized linear models
### Aliases: pgls pgls.likelihood pgls.blenTransform
### Keywords: models regression

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)
mod1 <- pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), shorebird, lambda='ML')
mod2 <- pgls(log(Egg.Mass) ~ log(M.Mass), data=shorebird, lambda='ML', delta='ML')



