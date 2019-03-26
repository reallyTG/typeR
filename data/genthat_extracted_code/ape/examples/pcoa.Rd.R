library(ape)


### Name: pcoa
### Title: Principal Coordinate Analysis
### Aliases: pcoa biplot.pcoa
### Keywords: multivariate

### ** Examples

# Oribatid mite data from Borcard and Legendre (1994)

## Not run: 
##D if (require(vegan)) {
##D data(mite)  # Community composition data, 70 peat cores, 35 species
##D 
##D # Select rows 1:30. Species 35 is absent from these rows. Transform to log
##D mite.log <- log(mite[1:30,-35]+1)  # Equivalent: log1p(mite[1:30,-35])
##D 
##D # Principal coordinate analysis and simple ordination plot
##D mite.D <- vegdist(mite.log, "bray")
##D res <- pcoa(mite.D)
##D res$values
##D biplot(res)
##D 
##D # Project unstandardized and standardized species on the PCoA ordination plot
##D mite.log.st = apply(mite.log, 2, scale, center=TRUE, scale=TRUE)
##D 
##D par(mfrow=c(1,2))
##D biplot(res, mite.log)
##D biplot(res, mite.log.st)
##D 
##D # Reverse the ordination axes in the  plot
##D par(mfrow=c(1,2))
##D biplot(res, mite.log, dir.axis1=-1, dir.axis2=-1)
##D biplot(res, mite.log.st, dir.axis1=-1, dir.axis2=-1)
##D }
## End(Not run)



