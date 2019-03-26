library(bqtl)


### Name: map.names
### Title: Look up names of markers or loci
### Aliases: map.names map.names.default map.names.bqtl map.names.bqtl.list
###   map.names.analysis.object map.names.map.frame
### Keywords: utilities

### ** Examples

data(little.ana.bc)

map.names(little.ana.bc,chromo=1,cM=24)

map.names(little.ana.bc,chromo=c(1,1),cM=c(40,55))

fit <- bqtl( bc.phenotype ~ locus(23,42) , little.ana.bc )

map.names( fit )

## Don't show: 
rm(fit, little.ana.bc)
## End(Don't show)



