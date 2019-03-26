library(merTools)


### Name: modelFixedEff
### Title: Extract averaged fixed effect parameters across a list of merMod
###   objects
### Aliases: modelFixedEff

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
modelFixedEff(mod)



