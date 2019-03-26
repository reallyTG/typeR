library(merTools)


### Name: lmerModList
### Title: Apply a multilevel model to a list of data frames
### Aliases: lmerModList blmerModList glmerModList bglmerModList

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
summary(mod)



