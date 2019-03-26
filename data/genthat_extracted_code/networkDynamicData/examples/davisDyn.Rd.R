library(networkDynamicData)


### Name: davisDyn
### Title: dynamic versions of the Southern Women Data Set (Davis)
### Aliases: davisDyn davisActorsDyn
### Keywords: datasets

### ** Examples

data(davisDyn)
davisDyn

# convert the dates of the events from numeric seconds
as.POSIXlt(get.change.times(davisDyn),origin="1970-01-01")

data(davisActorsDyn)
davisActorsDyn



