library(caper)


### Name: anova.pgls
### Title: Anova and AIC tables for 'pgls' models.
### Aliases: anova.pgls anova.pglslist logLik.pgls
### Keywords: utils stats

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)

mod1 <- pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), shorebird) 
anova(mod1)

mod2 <- pgls(log(Egg.Mass) ~ log(M.Mass) + log(F.Mass), shorebird)  
mod3 <- pgls(log(Egg.Mass) ~ log(M.Mass) , shorebird)
mod4 <- pgls(log(Egg.Mass) ~ 1, shorebird)

anova(mod1, mod2, mod3, mod4)
AIC(mod1, mod2, mod3, mod4)



