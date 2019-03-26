library(caper)


### Name: caic.diagnostics
### Title: Diagnostic tools for independent contrasts models
### Aliases: caic.label caic.diagnostics caic.robust caic.table
###   print.caic.diagnostics
### Keywords: hplot models utils

### ** Examples

data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
crunchMod <- crunch(log(Egg.Mass) ~  log(M.Mass) + log(F.Mass), data=shorebird)
caic.diagnostics(crunchMod)



