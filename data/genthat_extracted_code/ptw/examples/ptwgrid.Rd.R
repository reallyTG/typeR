library(ptw)


### Name: ptwgrid
### Title: Calculate RMS or WCC values on a grid
### Aliases: ptwgrid
### Keywords: manip

### ** Examples

  ## Not run: 
##D   data(gaschrom)
##D   mygrid <- ptwgrid(gaschrom[1,], gaschrom[16,],
##D                     coef.mins = c(-10, .9), coef.max = c(10, 1.1),
##D                     coef.lengths = c(21, 21))
##D   image(seq(-10, 10, length = 21),
##D         seq(.9, 1.1, length = 21),
##D         mygrid)
## End(Not run)



