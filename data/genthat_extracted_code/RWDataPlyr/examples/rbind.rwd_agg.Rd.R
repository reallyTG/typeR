library(RWDataPlyr)


### Name: rbind.rwd_agg
### Title: Combine RiverWare data aggregators
### Aliases: rbind.rwd_agg cbind.rwd_agg

### ** Examples


ra1 <- rwd_agg(data.frame(
  file = "KeySlots.rdf",
  slot = "Powell.Pool Elevation",
  period = "wy",
  summary = "min",
  eval = "<",
  t_s = 3550,
  variable = "powellLt3550",
  stringsAsFactors = FALSE
))

ra2 <- rwd_agg(read.csv(
  system.file(
    "extdata/rwd_agg_files/passing_aggs.csv", 
    package = "RWDataPlyr"
  ), 
  stringsAsFactors = FALSE
))

rbind(ra1, ra2)

## Not run: 
##D # will fail because you cannot have repeating variable names
##D rbind(ra1, ra1)
##D 
##D # will also fail
##D cbind(ra1, ra2)
## End(Not run)




