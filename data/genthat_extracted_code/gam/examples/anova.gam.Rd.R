library(gam)


### Name: anova.Gam
### Title: Analysis of Deviance for a Generalized Additive Model
### Aliases: anova.Gam summary.Gam
### Keywords: models regression nonparametric smooth

### ** Examples

data(gam.data)
Gam.object <- gam(y~s(x,6)+z,data=gam.data)
anova(Gam.object)
Gam.object2 <- update(Gam.object, ~.-z)
anova(Gam.object, Gam.object2, test="Chisq")



