library(bqtl)


### Name: map.location
### Title: Report map location
### Aliases: map.loc map.location map.location.default
###   map.location.analysis.object map.location.bqtl map.location.bqtl.list
### Keywords: regression

### ** Examples


data(little.ana.bc)

map.loc(little.ana.bc, c(1,15,45))
map.loc(little.ana.bc,chromo=3,cM=22)
map.loc(little.ana.bc,"m.12")
rm(little.ana.bc)



