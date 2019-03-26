library(bqtl)


### Name: linear.bayes
### Title: Bayesian QTL mapping via Linearized Likelihood
### Aliases: linear.bayes
### Keywords: regression

### ** Examples

data( little.ana.bc )
little.lin <- linear.bayes( bc.phenotype~locus(all), little.ana.bc, rparm=1 )
par(mfrow=c(2,3))
plot( little.ana.bc, little.lin$loc.posterior, type="h" )
little.lin$odds
par(mfrow=c(1,1))
plot(fitted(little.lin), residuals(little.lin))
## Don't show: 
rm(little.lin,little.ana.bc)
## End(Don't show)



