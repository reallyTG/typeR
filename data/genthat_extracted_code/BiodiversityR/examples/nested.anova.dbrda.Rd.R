library(BiodiversityR)


### Name: nested.anova.dbrda
### Title: Nested Analysis of Variance via Distance-based Redundancy
###   Analysis or Non-parametric Multivariate Analysis of Variance
### Aliases: nested.anova.dbrda nested.npmanova
### Keywords: multivariate

### ** Examples

## Not run: 
##D library(vegan)
##D data(warcom)
##D data(warenv)
##D # use larger number of permutations for real studies
##D nested.npmanova(warcom~rift.valley+popshort, data=warenv, method="jac", 
##D     permutations=5)
##D nested.anova.dbrda(warcom~rift.valley+popshort, data=warenv, method="jac", 
##D     permutations=5)
## End(Not run)



