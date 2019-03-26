library(bayesPop)


### Name: pop.aggregate
### Title: Aggregation of Population Projections
### Aliases: pop.aggregate get.pop.aggregation pop.aggregate.subnat
### Keywords: distribution

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D pred <- pop.predict(countries=c(528,218,450), output.dir=sim.dir)
##D aggr <- pop.aggregate(pred, 900) # aggregating World (i.e. all countries available in pred)
##D pop.trajectories.plot(aggr, 900, sum.over.ages=TRUE)
##D # countries over which we aggregated:
##D subset(UNlocations, country_code %in% aggr$aggregated.countries[["900"]])
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



