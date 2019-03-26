library(marmap)


### Name: trans.mat
### Title: Transition matrix
### Aliases: trans.mat

### ** Examples

# Load and plot bathymetry
data(hawaii)
summary(hawaii)
plot(hawaii)

## Not run: 
##D # Compute transition object with no depth constraint
##D trans1 <- trans.mat(hawaii)
##D 
##D # Compute transition object with minimum depth constraint: 
##D # path impossible in waters shallower than -200 meters depth
##D trans2 <- trans.mat(hawaii,min.depth=-200)
##D 
##D # Visualizing results
##D par(mfrow=c(1,2))
##D plot(raster(trans1), main="No depth constraint")
##D plot(raster(trans2), main="Constraint in shallow waters")
## End(Not run)



