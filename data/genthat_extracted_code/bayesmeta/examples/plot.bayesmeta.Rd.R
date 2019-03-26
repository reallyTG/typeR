library(bayesmeta)


### Name: plot.bayesmeta
### Title: Generate summary plots for a 'bayesmeta' object.
### Aliases: plot.bayesmeta
### Keywords: hplot

### ** Examples

## Not run: 
##D # example data by Snedecor and Cochran:
##D data("SnedecorCochran")
##D 
##D # analyze using a weakly informative prior
##D # (may take a few seconds to compute!):
##D ma <- bayesmeta(y=SnedecorCochran[,"mean"], sigma=sqrt(SnedecorCochran[,"var"]),
##D                 label=SnedecorCochran[,"no"],
##D                 mu.prior.mean=50, mu.prior.sd=50,
##D                 tau.prior=function(x){dhalfcauchy(x, scale=10)})
##D 
##D # show some plots:
##D plot(ma, main="Snedecor/Cochran data", prior=TRUE)
##D plot(ma, main="Snedecor/Cochran data", which=1, violin=TRUE)
## End(Not run)



