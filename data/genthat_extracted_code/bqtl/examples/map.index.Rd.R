library(bqtl)


### Name: map.index
### Title: Look up numerical index(es) of map locations
### Aliases: map.index map.index.default map.index.analysis.object
### Keywords: methods

### ** Examples

data(little.ana.bc)
map.index(little.ana.bc,chromo=1,cM=25) # locus nearest 1,25
index.chr.1 <- map.index(little.ana.bc,chromo=1)
fit.on.1 <- bqtl(bc.phenotype~locus(index.chr.1),little.ana.bc)
summary( loglik( fit.on.1 ) )




