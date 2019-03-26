library(spatstat)


### Name: as.boxx
### Title: Convert Data to Multi-Dimensional Box
### Aliases: as.boxx

### ** Examples

 # Convert unit square to two dimensional box.
 W <- owin()
 as.boxx(W)
 # Make three dimensional box [0,1]x[0,1]x[0,1] from numeric vector
 as.boxx(c(0,1,0,1,0,1))



