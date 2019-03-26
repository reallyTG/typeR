library(merTools)


### Name: ranef.merModList
### Title: Extract random-effects estimates for a merModList
### Aliases: ranef.merModList

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
ranef(mod)



