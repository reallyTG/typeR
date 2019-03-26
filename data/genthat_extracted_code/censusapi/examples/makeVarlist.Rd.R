library(censusapi)


### Name: makeVarlist
### Title: Use variable metadata to find variables containing a given
###   string.
### Aliases: makeVarlist

### ** Examples

# Return a list, and then use getCensus function to retrieve those variables
## No test: 
myvars <- makeVarlist(name = "timeseries/poverty/saipe",
  find = "Ages 0-4",
  varsearch = "label")
myvars
saipe_dt <- getCensus(name = "timeseries/poverty/saipe",
  time = 2016,
  vars = myvars,
  region = "state:*")
head(saipe_dt)
## End(No test)



