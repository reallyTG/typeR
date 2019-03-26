library(bqtl)


### Name: summary.bqtl
### Title: Summarize bqtl object
### Aliases: summary.bqtl
### Keywords: methods

### ** Examples

data(little.ana.bc)
fit <- bqtl( bc.phenotype~locus(4)*locus(45), little.ana.bc,
return.hess=TRUE )
summary(fit)
## Don't show: 
rm(little.ana.bc,fit)
## End(Don't show)



