library(merTools)


### Name: VarCorr.merModList
### Title: Extract the variances and correlations for random effects from a
###   merMod list
### Aliases: VarCorr.merModList

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
VarCorr(mod)



