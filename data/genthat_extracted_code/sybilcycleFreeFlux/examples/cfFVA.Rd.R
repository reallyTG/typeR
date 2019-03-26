library(sybilcycleFreeFlux)


### Name: cfFVA
### Title: cycle free flux variability
### Aliases: cfFVA lrFVA
### Keywords: Flux variability cycle free flux

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
library(sybilcycleFreeFlux)
data(Ec_core)
model=Ec_core

fva=cfFVA(model,react_id(model))
write.csv(file="cfFVA1_cnd_res.csv",fva[[1]]);
write.csv(file="cfFVA1_cnd_det.csv",fva[[2]]);
#plot fluxes

## The function is currently defined as
"cfFVA"



