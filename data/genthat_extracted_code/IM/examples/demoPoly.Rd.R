library(IM)


### Name: demoPoly
### Title: Calculate and display polynomials used to calculate image
###   moments
### Aliases: demoPoly demoPoly-methods
###   demoPoly,Numbers,character,numeric-method
### Keywords: utilities misc

### ** Examples

#display chebyshev polynomials of orders 20 to 25 for dimensionality 256
demoPoly(order = 20:25,type = "cheby",N = 256)

## Not run: 
##D 	#display generalized Pseudo-Zernike polynomials of order and repetition (3,2), (4,2), (5,3), (6,3) 
##D 	#for pixel dimensions of 300x300, with paramater a=0
##D 	demoPoly(rbind(c(3,2), c(4,2), c(5,3), c(6,3)), "gpzm", 300, 0);
## End(Not run)

## Not run: 
##D 	#display Radial Fourier polynomials of order and repetition (3,2), (4,2), (5,3), (6,3)  
##D 	#for pixel dimensions of 300x300,
##D 	demoPoly(rbind(c(3,2), c(4,2), c(5,3), c(6,3)), "fr", 300);
## End(Not run)




