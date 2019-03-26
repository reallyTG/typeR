library(adehabitatHS)


### Name: madifa
### Title: The MADIFA: a Factorial Decomposition of the Mahalanobis
###   Distances
### Aliases: madifa print.madifa hist.madifa scatter.madifa predict.madifa
###   plot.madifa s.madifa
### Keywords: multivariate

### ** Examples

## Not run: 
##D 
##D data(bauges)
##D 
##D map <- bauges$map
##D locs <- bauges$loc
##D 
##D ## We prepare the data for the MADIFA
##D tab <- slot(map, "data")
##D pr <- slot(count.points(locs, map), "data")[,1]
##D 
##D 
##D ## We then perform the PCA before the MADIFA
##D pc <- dudi.pca(tab, scannf = FALSE)
##D (mad <- madifa(pc, pr, nf=7,
##D                scannf = FALSE))
##D 
##D #########################################
##D ##                                     ##
##D ## Graphical exploration of the MADIFA ##
##D ##                                     ##
##D #########################################
##D 
##D hist(mad)
##D 
##D plot(mad, map)
##D 
##D ## this plot represents:
##D ##  - the eigenvalues diagram
##D ##  - the scores of the columns on the axes
##D ##  - a graph of the niche in the available space
##D ##  - a map of the Mahalanobis distances computed
##D ##    using all environmental variables
##D ##  - a map of the Mahalanobis distances computed
##D ##    using the two factorial axes used in the
##D ##    previous graphs
##D ##  - the correlation between habitat variables
##D ##    and factorial axes
##D ##  - the geographical maps of the two
##D ##    factorial axes
##D 
##D ## predict with just the first axis
##D pred <- predict(mad, map, nf=1)
##D image(pred)
##D 
##D 
##D 
##D #########################################
##D ##                                     ##
##D ## Mathematical properties of  MADIFA  ##
##D ##                                     ##
##D #########################################
##D 
##D ## mad$li is equal to mad$l1, up to a constant (mad$l1 is normed)
##D plot(mad$li[,1],mad$l1[,1])
##D 
##D ## This constant is the square root of the corresponding eigenvalue:
##D ## the variance of mad$l1 is equal to the eigenvalue
##D apply(mad$l1,2,function(x) sum(x^2))/nrow(mad$li)
##D 
##D ## the variance of mad$l1 weighted by pr is equal to 1
##D apply(mad$l1,2,function(x) sum(mad$pr*x^2)/sum(mad$pr))
##D 
##D ## Therefore, the eigenvalues are equal to the average of Mahalanobis
##D ## distance for the available resource units on each axis
##D mean(mahalanobis(matrix(mad$l1[,1], ncol=1), 0, 1))
##D mad$eig[1]
##D 
##D ## Computation of the Mahalanobis distances
##D ma1 <- mahasuhab(map, locs)
##D 
##D ## The sum of squared scores for a given Resource unit is equal to the
##D ## Mahalanobis distances
##D ma2 <- apply(mad$l1,1, function(x) sum(x^2))
##D plot(ma2, slot(ma1, "data")[,1])
##D 
## End(Not run)




