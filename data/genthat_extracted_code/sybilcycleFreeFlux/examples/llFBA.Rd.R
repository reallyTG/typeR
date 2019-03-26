library(sybilcycleFreeFlux)


### Name: llFBA
### Title: looplessFBA
### Aliases: llFBA
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
library(sybilcycleFreeFlux)
data(Ec_core)
model=Ec_core
llFBA(model,solver="glpkAPI",verbose=3)

## The function is currently defined as
"llFBA"



