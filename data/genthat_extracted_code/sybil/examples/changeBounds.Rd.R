library(sybil)


### Name: changeBounds
### Title: Change Variable Bounds in a Metabolic Network
### Aliases: changeBounds
### Keywords: optimize

### ** Examples

  ## change the E.coli core model to lactate input:
  data(Ec_core)
  Ec_new <- changeBounds(Ec_core,
                         c("EX_glc", "EX_lac"),
                         lb = c(0, -20), ub = 1000)



