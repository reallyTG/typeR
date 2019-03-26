library(caper)


### Name: summary.caic
### Title: Summarize a crunch, brunch or macrocaic analysis
### Aliases: summary.caic print.caic
### Keywords: methods

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
crunchMod <- crunch(Egg.Mass ~ F.Mass + M.Mass, data=shorebird)
print(crunchMod)
summary(crunchMod)



