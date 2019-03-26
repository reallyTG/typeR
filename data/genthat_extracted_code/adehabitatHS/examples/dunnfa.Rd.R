library(adehabitatHS)


### Name: dunnfa
### Title: Factorial Analysis of the Specialization in Habitat Selection
###   Studies. Unpublished Work of James Dunn (University of Arkansas)
### Aliases: dunnfa print.dunnfa
### Keywords: multivariate

### ** Examples


## Not run: 
##D data(bauges)
##D 
##D map <- bauges$map
##D locs <- bauges$loc
##D 
##D ## We prepare the data for the analysis
##D tab <- slot(map, "data")
##D pr <- slot(count.points(locs, map), "data")[,1]
##D 
##D ## We then perform the PCA before the analysis
##D pc <- dudi.pca(tab, scannf = FALSE)
##D (dun <- dunnfa(pc, pr, nf=2,
##D                scannf = FALSE))
##D 
##D ## We should keep one axis:
##D barplot(dun$eig)
##D 
##D ## The correlation of the variables with the first two axes:
##D s.arrow(dun$cor)
##D 
##D ## A factorial map of the niche (centering on the available points)
##D scatterniche(dun$liA, dun$pr, pts=TRUE)
##D 
##D ## a map of the reduced rank Mahalanobis distances
##D ## (here, with one axis)
##D dun2 <- dunnfa(pc, pr, nf=1,
##D               scannf = FALSE)
##D df <- data.frame(MD=dun2$mahasu)
##D coordinates(df) <- coordinates(map)
##D gridded(df) <- TRUE
##D image(df)
##D 
##D 
##D ## Compute the specialization on the row scores of
##D ## the analysis:
##D apply(dun$liA, 2, function(x) {
##D    varav <- sum((x - mean(x))^2) / length(x)
##D    meanus <- sum(dun$pr*x)/sum(dun$pr)
##D    varus <- sum(dun$pr * (x - meanus )^2)/sum(dun$pr)
##D    return(varav/varus)
##D })
##D ## The eigenvalues:
##D dun$eig
##D 
## End(Not run)





