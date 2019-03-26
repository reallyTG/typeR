library(caper)


### Name: crunch
### Title: Comparative analysis using the crunch algorithm.
### Aliases: crunch contrCalc
### Keywords: models regression

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
crunchMod <- crunch(Egg.Mass ~ F.Mass + M.Mass, data=shorebird)
summary(crunchMod)
# plot the contrasts
crunchTab <- caic.table(crunchMod)
plot(Egg.Mass ~ F.Mass, crunchTab)
# for the actual model diagnostics
par(mfrow=c(3,2))
caic.diagnostics(crunchMod)



