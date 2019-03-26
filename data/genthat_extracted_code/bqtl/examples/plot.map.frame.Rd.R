library(bqtl)


### Name: plot.map.frame
### Title: plots by chromosome location
### Aliases: plot.map.frame plot.analysis.object
### Keywords: hplot

### ** Examples


data( little.ana.bc )
null.llk <- loglik(bqtl(bc.phenotype~1,little.ana.bc))
llk <- loglik( bqtl( bc.phenotype~locus(all), little.ana.bc) ) - null.llk
.old.par <- par(mfrow=c(2,3))
plot.map.frame(little.ana.bc$map.frame,llk)
par(.old.par)
## Don't show: 
 rm(null.llk, llk, little.ana.bc, .old.par ) 
## End(Don't show)




