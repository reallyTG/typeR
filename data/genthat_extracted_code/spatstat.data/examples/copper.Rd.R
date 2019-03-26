library(spatstat.data)


### Name: copper
### Title: Berman-Huntington points and lines data
### Aliases: copper
### Keywords: datasets spatial

### ** Examples


  data(copper)

  if(require(spatstat)) {

  # Plot full dataset

  plot(copper$Points)
  plot(copper$Lines, add=TRUE)

  # Plot southern half of data
  plot(copper$SouthPoints)
  plot(copper$SouthLines, add=TRUE)

  ## Not run: 
##D     Z <- distmap(copper$SouthLines)
##D     plot(Z)
##D     X <- copper$SouthPoints
##D     ppm(X, ~D, covariates=list(D=Z))
##D   
## End(Not run)
  }



