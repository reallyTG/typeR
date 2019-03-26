library(bayesmeta)


### Name: bayesmeta-package
### Title: Bayesian Random-Effects Meta-Analysis
### Aliases: bayesmeta-package
### Keywords: models package

### ** Examples

# example data by Snedecor and Cochran:
data("SnedecorCochran")

## Not run: 
##D # analysis using improper uniform prior
##D # (may take a few seconds to compute!):
##D bma <- bayesmeta(y=SnedecorCochran[,"mean"],
##D                  sigma=sqrt(SnedecorCochran[,"var"]),
##D                  label=SnedecorCochran[,"no"])
##D 
##D # show some summary statistics:
##D bma
##D 
##D # show a bit more details:
##D summary(bma)
##D 
##D # show a forest plot:
##D forestplot(bma)
##D 
##D # show some more plots:
##D plot(bma)
## End(Not run)



