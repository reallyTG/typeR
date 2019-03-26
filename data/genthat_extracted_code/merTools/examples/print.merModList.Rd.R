library(merTools)


### Name: print.merModList
### Title: Print the results of a merMod list
### Aliases: print.merModList

### ** Examples

sim_list <- replicate(n = 10,
        expr = sleepstudy[sample(row.names(sleepstudy), 180),],
        simplify=FALSE)
fml <- "Reaction ~ Days + (Days | Subject)"
mod <- lmerModList(fml, data = sim_list)
print(mod)



