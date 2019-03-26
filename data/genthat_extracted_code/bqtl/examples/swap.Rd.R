library(bqtl)


### Name: swap
### Title: MCMC sampling of multigene models
### Aliases: swap
### Keywords: regression

### ** Examples

data( little.ana.bc )
little.vc <- varcov( bc.phenotype~locus(all), little.ana.bc)
little.4 <- swap( little.vc, c(1,15,55,75), rparm=1, 50, little.ana.bc )
little.4.smry <- summary( little.4 )
print(c("Bayes Factor (3 vs 4)"=little.4.smry$ratio$mean))
par(mfrow=c(3,2))
plot( little.ana.bc, little.4.smry$loc.posterior, type="h",
 ylab="E(genes)" )
rm(little.4,little.vc,little.ana.bc)



