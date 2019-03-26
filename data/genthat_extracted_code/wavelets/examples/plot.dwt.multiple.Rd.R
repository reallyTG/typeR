library(wavelets)


### Name: plot.dwt.multiple
### Title: Plot Multiple DWT Objects
### Aliases: plot.dwt.multiple
### Keywords: ts

### ** Examples

X <- rnorm(2048)
# Create DWT Object of X with the "la8" filter.
dwtobj1 <- dwt(X, filter = "la8")
# Create DWT Object of X with the "d4" filter.
dwtobj2 <- dwt(X, filter = "d4")
# Create DWT Object of X with the "haar" filter
dwtobj3 <- dwt(X, filter = "haar")
# Create DWT Object of X with the "c6" filter
dwtobj4 <- dwt(X, filter = "c6")

#Create list of dwt objects
dwtlist <- list(dwtobj1, dwtobj2, dwtobj3, dwtobj4)

# Plot the dwt objects and the wavelet coefficients of level 1 through 6
# and the scaling coefficients of level 6.  The first level drawn will
# be purple and the next level drawn will be gold.
plot.dwt.multiple(dwtlist, levels = 6, col = c("purple", "gold"))

# Plot the dwt objects and the wavelet coefficients of level 1, 3, and 5
# and scaling coefficients of level 2, and 4.
plot.dwt.multiple(dwtlist, levels = list(c(1,3,5), c(2,4)))




