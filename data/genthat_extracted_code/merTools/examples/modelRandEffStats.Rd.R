library(merTools)


### Name: modelRandEffStats
### Title: Extract data.frame of random effect statistics from merMod List
### Aliases: modelRandEffStats

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
modelRandEffStats(mod)



