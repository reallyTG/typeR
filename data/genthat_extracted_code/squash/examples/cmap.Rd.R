library(squash)


### Name: cmap
### Title: Apply a color map to numeric data
### Aliases: cmap
### Keywords: color

### ** Examples

  x <- y <- 1:50
  mat1 <- outer(x, y)
  
  ## several ways of visualizing the matrix mat1:
  plot(col(mat1), row(mat1), col = cmap(mat1), pch = 16)
  
  cimage(x, y, zcol = cmap(mat1))

  colorgram(x = x, y = y, z = mat1)
  
  ## treatment of out-of-domain values
  map <- makecmap(0:100, colFn = greyscale)
  x <- y <- -10:10
  mat2 <- outer(x, y, "*")

  ## Not run: 
##D   ## Values outside the domain of "map" generate an error...
##D   plot(col(mat2), row(mat2), col = cmap(mat2, map), pch = 15, cex = 2)
##D 
##D   ## ... unless we specify "outlier", but this still generates a warning
##D   plot(col(mat2), row(mat2), col = cmap(mat2, map, outlier = 'red'), pch = 15, cex = 2)
##D   
## End(Not run)
  



