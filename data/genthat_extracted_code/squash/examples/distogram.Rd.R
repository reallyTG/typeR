library(squash)


### Name: distogram
### Title: Draw a color-coded triangular distance matrix
### Aliases: distogram
### Keywords: hplot

### ** Examples
 
  ## Distances between European cities
  distogram(eurodist, title = 'Distance (km)')  

  ## Some variations
  map <- distogram(eurodist, key = FALSE, colFn = jet, right = TRUE)  
  vkey(map, title = 'Distance (km)', x = -8)




