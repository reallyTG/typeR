library(spatstat)


### Name: as.matrix.im
### Title: Convert Pixel Image to Matrix or Array
### Aliases: as.matrix.im as.array.im
### Keywords: spatial methods

### ** Examples

   # artificial image
   Z <- setcov(square(1))

   M <- as.matrix(Z)

   median(M)
   
   ## Not run: 
##D    # plot the cumulative distribution function of pixel values
##D    plot(ecdf(as.matrix(Z)))
##D    
## End(Not run)



