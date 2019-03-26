library(BradleyTerry2)


### Name: chameleons
### Title: Male Cape Dwarf Chameleons: Measured Traits and Contest Outcomes
### Aliases: chameleons
### Keywords: datasets

### ** Examples


##
## Reproduce Table 3 from page 1268 of the above paper:
##
summary(chameleon.model <- BTm(player1 = winner, player2 = loser,
  formula = ~ prev.wins.2 + ch.res[ID] + prop.main[ID] + (1|ID), id = "ID",
  data = chameleons))
head(BTabilities(chameleon.model))
##
## Note that, although a per-chameleon random effect is specified as in the
## above [the term "+ (1|ID)"], the estimated variance for that random
## effect turns out to be zero in this case.  The "prior experience"
## effect ["+ prev.wins.2"] in this analysis has explained most of the
## variation, leaving little for the ID-specific predictors to do.
## Despite that, two of the ID-specific predictors do emerge as
## significant.
##
## Test whether any of the other ID-specific predictors has an effect:
##
add1(chameleon.model, ~ . + jl.res[ID] + tl.res[ID] + mass.res[ID] +
  SVL[ID] + prop.patch[ID]) 




