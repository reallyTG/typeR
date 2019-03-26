library(colordistance)


### Name: getColorDistanceMatrix
### Title: Distance matrix for a list of color cluster sets
### Aliases: getColorDistanceMatrix

### ** Examples

## Not run: 
##D cluster.list <- colordistance::getHistList(c(system.file("extdata",
##D "Heliconius/Heliconius_A", package="colordistance"), system.file("extdata",
##D "Heliconius/Heliconius_B", package="colordistance")), lower=rep(0.8, 3),
##D upper=rep(1, 3))
##D 
##D # Default values - recommended!
##D colordistance::getColorDistanceMatrix(cluster.list, main="EMD")
##D 
##D # Without plotting
##D colordistance::getColorDistanceMatrix(cluster.list, plotting=FALSE)
##D 
##D # Use chi-squared instead
##D colordistance::getColorDistanceMatrix(cluster.list, method="chisq", main="Chi-squared")
##D 
##D # Override ordering (throws a warning if you're trying to do this with
##D # chisq!)
##D colordistance::getColorDistanceMatrix(cluster.list, method="chisq",
##D ordering=TRUE, main="Chi-squared w/ ordering")
##D 
##D # Specify high size weight/low color weight for weighted pairs
##D colordistance::getColorDistanceMatrix(cluster.list, method="weighted.pairs",
##D color.weight=0.1, size.weight=0.9, main="Weighted pairs")
##D 
##D # Color distance only
##D colordistance::getColorDistanceMatrix(cluster.list, method="color.dist",
##D ordering=TRUE, main="Color distance only")
## End(Not run)



