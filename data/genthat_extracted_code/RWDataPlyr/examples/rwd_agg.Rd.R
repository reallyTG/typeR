library(RWDataPlyr)


### Name: rwd_agg
### Title: Class to specify how to aggregate RiverWare data
### Aliases: rwd_agg

### ** Examples

# determine if Powell's minimum water year elevation is < 3550'
rwd_agg(
  data.frame(
    file = "KeySlots.rdf",
    slot = "Powell.Pool Elevation",
    period = "wy",
    summary = "min",
    eval = "<",
    t_s = 3550,
    variable = "powellLt3550",
    stringsAsFactors = FALSE
  )
)

# get all the monthly slots in KeySlots.rdf
rwd_agg(rdfs = "KeySlots.rdf")




