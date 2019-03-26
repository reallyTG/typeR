library(VCA)


### Name: SattDF
### Title: Satterthwaite Approximation for Total Degrees of Freedom and for
###   Single Variance Components.
### Aliases: SattDF

### ** Examples


## Not run: 
##D data(dataEP05A2_2)
##D res <- anovaVCA(y~day/run, dataEP05A2_2)
##D VCA:::SattDF(res$aov.tab[-1,"MS"], getMat(res, "Ci.MS"), res$aov.tab[-1,"DF"], type="tot")
##D 
##D # now approximating individual DF for variance components
##D VCA:::SattDF(res$aov.tab[-1,"MS"], getMat(res, "Ci.MS"), res$aov.tab[-1,"DF"], type="i")
## End(Not run)



