library(RWDataPlyr)


### Name: rdf_to_rwtbl
### Title: Convert an rdf to a tibble
### Aliases: rdf_to_rwtbl rdf_to_rwtbl2

### ** Examples

rdftbl <- rdf_to_rwtbl(keyRdf)
# same as previous, except you do not want "Year" and "Month" columns
rdftbl <- rdf_to_rwtbl(keyRdf, add_ym = FALSE)
# but you do want to keep the object name seperately:
rdftbl <- rdf_to_rwtbl(keyRdf, add_ym = FALSE, keep_cols = "Object")
rdftbl <- rdf_to_rwtbl(sysRdf, scenario = "ISM1988_2014,2007Dems,IG,2002")

# rdf_to_rwtbl2 wants a file path instead of an rdf object
rdfPath <- system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/KeySlots.rdf", 
  package = "RWDataPlyr"
)
rdftbl <- rdf_to_rwtbl2(rdfPath)




