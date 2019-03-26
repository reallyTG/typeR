library(merTools)


### Name: modelInfo
### Title: Extract model information from a merMod
### Aliases: modelInfo

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
modelInfo(mod[[1]])
lapply(mod, modelInfo)



