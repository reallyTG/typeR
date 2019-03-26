library(bqtl)


### Name: bqtl.fitter
### Title: Get loglikelihoods for many models of a common form
### Aliases: bqtl.fitter
### Keywords: models

### ** Examples

data( little.ana.bc )
little.setup <-
bqtl( bc.phenotype~locus(1)*locus(2), little.ana.bc, setup=TRUE )
combos <- t( as.matrix( expand.grid( 1:21, 44:64 ) ) )
little.update <- bqtl.fitter(little.setup, combos, little.ana.bc)
little.res <- matrix( little.update, nr=21 )
image( 1:21, 44:64, little.res )
rm(little.ana.bc, little.update, little.res  )



