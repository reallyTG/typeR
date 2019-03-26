library(spatstat)


### Name: Gfox
### Title: Foxall's Distance Functions
### Aliases: Gfox Jfox
### Keywords: spatial nonparametric

### ** Examples

  data(copper)
  X <- copper$SouthPoints
  Y <- copper$SouthLines
  G <- Gfox(X,Y)
  J <- Jfox(X,Y, correction="km")
  ## Don't show: 
  J <- Jfox(X,Y, correction="km", eps=1)
  
## End(Don't show)
  ## Not run: 
##D   J <- Jfox(X,Y, correction="km", eps=0.25)
##D   
## End(Not run)



