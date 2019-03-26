library(bayesPop)


### Name: pop.predict.subnat
### Title: Subnational Probabilistic Population Projection
### Aliases: pop.predict.subnat
### Keywords: distribution

### ** Examples

## Not run: 
##D # Subnational projections for Canada
##D #########
##D data.dir <- file.path(find.package("bayesPop"), "extdata")
##D 
##D # Use national data for tfr and e0
##D ###
##D sim.dir <- tempfile()
##D pred <- pop.predict.subnat(output.dir = sim.dir,
##D             locations = file.path(data.dir, "CANlocations.txt"),
##D             inputs = list(popM = file.path(data.dir, "CANpopM.txt"),
##D                           popF = file.path(data.dir, "CANpopF.txt"),
##D                           tfr.file = "median_"
##D                         ),
##D             verbose = TRUE)
##D pop.trajectories.plot(pred, "Alberta", sum.over.ages = TRUE)
##D unlink(sim.dir, recursive=TRUE)
##D 
##D # Use subnational TFR simulation
##D ###
##D # Subnational TFR projections for Canada (from ?tfr.predict.subnat)
##D my.subtfr.file <- file.path(find.package("bayesTFR"), 'extdata', 'subnational_tfr_template.txt')
##D tfr.nat.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D tfr.reg.dir <- tempfile()
##D tfr.preds <- tfr.predict.subnat(124, my.tfr.file = my.subtfr.file,
##D     sim.dir = tfr.nat.dir, output.dir = tfr.reg.dir, start.year = 2013)
##D  
##D # Pop projections
##D sim.dir <- tempfile()
##D pred <- pop.predict.subnat(output.dir = sim.dir,
##D             locations = file.path(data.dir, "CANlocations.txt"),
##D             inputs = list(popM = file.path(data.dir, "CANpopM.txt"),
##D                           popF = file.path(data.dir, "CANpopF.txt"),
##D                           patterns = file.path(data.dir, "CANpatterns.txt"),
##D                           tfr.sim.dir = file.path(tfr.reg.dir, "subnat", "c124")
##D                         ),
##D             verbose = TRUE)
##D pop.trajectories.plot(pred, "Alberta", sum.over.ages = TRUE)
##D pop.pyramid(pred, "Manitoba", year = 2050)
##D get.countries.table(pred)
##D 
##D # Aggregate to country level
##D aggr <- pop.aggregate.subnat(pred, regions = 124, 
##D             locations = file.path(data.dir, "CANlocations.txt"))
##D pop.trajectories.plot(aggr, "Canada", sum.over.ages = TRUE)
##D 
##D unlink(sim.dir, recursive = TRUE)
##D unlink(tfr.reg.dir, recursive = TRUE)
## End(Not run)


