library(RWDataPlyr)


### Name: rdf_aggregate
### Title: Aggregate RiverWare output for one or more scenarios
### Aliases: rdf_aggregate rw_scen_aggregate

### ** Examples

# rdf_aggregate() ----------

rdfPath <- system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most", 
  package = "RWDataPlyr"
)

rwa <- rwd_agg(read.csv(
  system.file(
    "extdata/rwd_agg_files/passing_aggs.csv", 
    package = "RWDataPlyr"
  ), 
 stringsAsFactors = FALSE
))

x <- rdf_aggregate(rwa[1,], rdf_dir = rdfPath, scenario = "Most")

# rw_scen_aggregate() ----------

scens <- c("ISM1988_2014,2007Dems,IG,2002", "ISM1988_2014,2007Dems,IG,Most")
scenNames <- c("2002", "Most")
namedScens <- scens
names(namedScens) <- scenNames

scenPath <- system.file("extdata/Scenario", package = "RWDataPlyr")

rwa <- rwd_agg(read.csv(
  system.file(
    "extdata/rwd_agg_files/passing_aggs.csv", 
    package = "RWDataPlyr"
  ), 
 stringsAsFactors = FALSE
))

x <- rw_scen_aggregate(namedScens, agg = rwa[1,], scen_dir = scenPath)

# y will be identical to x

y <- rw_scen_aggregate(
  scens, 
  agg = rwa[1,], 
  scen_dir = scenPath, 
  scen_names = scenNames
)

identical(x, y) # is TRUE




