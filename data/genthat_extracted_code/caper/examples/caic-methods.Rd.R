library(caper)


### Name: anova.caic
### Title: Anova and model checking methods for independent contrast
###   models.
### Aliases: anova.caic anova.caiclist logLik.caic plot.caic predict.caic
###   residuals.caic coef.caic
### Keywords: utils stats

### ** Examples

data(shorebird)
shorebird.data$lgEgg.Mass <- log(shorebird.data$Egg.Mass)
shorebird.data$lgM.Mass <- log(shorebird.data$M.Mass)
shorebird.data$lgF.Mass <- log(shorebird.data$F.Mass)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)

cMod1 <- crunch(lgEgg.Mass ~ lgM.Mass * lgF.Mass, data=shorebird)
cMod2 <- crunch(lgEgg.Mass ~ lgM.Mass + lgF.Mass, data=shorebird)
cMod3 <- crunch(lgEgg.Mass ~ lgM.Mass , data=shorebird)

anova(cMod1, cMod2, cMod3)
AIC(cMod1, cMod2, cMod3)

plot(cMod3)



