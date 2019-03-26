library(bayesmeta)


### Name: SnedecorCochran
### Title: Artificial insemination of cows example data
### Aliases: SnedecorCochran
### Keywords: datasets

### ** Examples

data("SnedecorCochran")

## Not run: 
##D # analyze using uniform prior:
##D bma1 <- bayesmeta(y=SnedecorCochran[,"mean"],
##D                   sigma=sqrt(SnedecorCochran[,"var"]),
##D                   label=SnedecorCochran[,"no"],
##D                   tau.prior="uniform")
##D 
##D # analyze using Jeffreys prior:
##D bma2 <- bayesmeta(y=SnedecorCochran[,"mean"],
##D                   sigma=sqrt(SnedecorCochran[,"var"]),
##D                   label=SnedecorCochran[,"no"],
##D                   tau.prior="Jeffreys")
##D 
##D # compare results:
##D print(bma1)
##D print(bma2)
##D 
##D forestplot(bma1)
##D forestplot(bma2)
## End(Not run)



