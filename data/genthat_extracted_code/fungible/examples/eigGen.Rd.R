library(fungible)


### Name: eigGen
### Title: Generate eigenvalues for R matrices with underlying component
###   structure
### Aliases: eigGen
### Keywords: Statistics

### ** Examples

## Example
set.seed(323)
nDim <- 25   # number of dimensions
nMaj <- 5    # number of major components
pmaj <- 0.70 # percentage of variance accounted for
             # by major components
thresh <- 1  # eigenvalue difference between last major component 
             # and first minor component
 
L <- eigGen(nDimensions = nDim, nMajorFactors = nMaj, 
            PrcntMajor = pmaj, threshold = thresh)

maxy <- max(L+1)

plotTitle <- paste("  n Dimensions = ", nDim, 
                   ",  n Major Factors = ", nMaj, 
				           "\n % Variance Major Factors = ", pmaj*100, 
						   "%", sep = "")
				 
plot(1:length(L), L, 
     type = "b", 
     main = plotTitle,
     ylim = c(0, maxy),
     xlab = "Dimensions", 
	   ylab = "Eigenvalues",
	   cex.main = .9)				 




