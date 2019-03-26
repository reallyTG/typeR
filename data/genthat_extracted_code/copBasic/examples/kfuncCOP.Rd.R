library(copBasic)


### Name: kfuncCOP
### Title: The Kendall (Distribution) Function of a Copula
### Aliases: kfuncCOP kmeasCOP
### Keywords: copula (characteristics) copula (properties) return period
###   (secondary) Salvadori et al. (2007) Examples and Exercises Joe (2014)
###   Examples and Exercises Durante and Sempi (2015) Examples and
###   Exercises Kendall Measure Kendall Function literature errors and
###   inconsistencies

### ** Examples

## Not run: 
##D # Salvadori et al. (2007, p. 148, fig. 3.5 [right])
##D zs <- seq(0,1, by=.01)
##D plot(zs, kmeasCOP(zs, cop=GHcop, para=5), log="y", type="l", lwd=4,
##D      xlab="Z <= z", ylab="Kendall Function", xlim=c(0,1), ylim=c(0.001,1))#
## End(Not run)



