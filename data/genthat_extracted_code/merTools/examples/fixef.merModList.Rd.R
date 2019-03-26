library(merTools)


### Name: fixef.merModList
### Title: Extract fixed-effects estimates for a merModList
### Aliases: fixef.merModList

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
fixef(mod)



