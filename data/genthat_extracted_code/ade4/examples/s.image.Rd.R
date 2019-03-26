library(ade4)


### Name: s.image
### Title: Graph of a variable using image and contour
### Aliases: s.image
### Keywords: hplot

### ** Examples

if(!adegraphicsLoaded()) {
  if(requireNamespace("splancs", quietly = TRUE)) {
    wxy <- data.frame(expand.grid(-3:3, -3:3))
    names(wxy) <- c("x", "y")
    z <- (1 / sqrt(2)) * exp(-(wxy$x ^ 2 + wxy$y ^ 2) / 2)
    par(mfrow = c(2, 2))
    s.value(wxy, z)
    s.image(wxy, z)
    s.image(wxy, z, kgrid = 5)
    s.image(wxy, z, kgrid = 15)
    par(mfrow = c(1, 1))
  }
  
  ## Not run: 
##D   data(t3012)
##D   if(requireNamespace("splancs", quietly = TRUE)) {
##D     par(mfrow = c(3, 4))
##D     for(k in 1:12)
##D       s.image(t3012$xy, scalewt(t3012$temp[, k]), kgrid = 3)
##D     par(mfrow = c(1, 1))
##D   }
##D       
##D   data(elec88)
##D   if(requireNamespace("splancs", quietly = TRUE)) {
##D     par(mfrow = c(3,4))
##D     for(k in 1:12)
##D       s.image(t3012$xy, scalewt(t3012$temp[, k]), kgrid = 3, sub = names(t3012$temp)[k],
##D         csub = 3, area = elec88$area)
##D     par(mfrow = c(1, 1))
##D   }
##D   
## End(Not run)
}


