library(bqtl)


### Name: make.analysis.obj
### Title: Set up data for QTL mapping
### Aliases: make.analysis.obj
### Keywords: manip

### ** Examples

data( little.bc.pheno )
data( little.mf.5 )
data( little.bc.markers )
names(little.bc.pheno)
little.ana.bc <- make.analysis.obj(little.bc.pheno$bc.phenotype,
                                   little.mf.5,little.bc.markers,
                                   method="BC1")
summary( little.ana.bc )

## Don't show: 
rm( little.ana.bc, little.bc.pheno, little.mf.5, little.bc.markers )
## End(Don't show)



