library(iemisc)


### Name: size
### Title: Size of R objects (GNU Octave/MATLAB compatible)
### Aliases: size

### ** Examples

library(iemisc)
library(gsubfn)


# Examples from GNU Octave size
object1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2, byrow = TRUE)
size(object1)


list[nr, nc] <- size(matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2,
                byrow = TRUE))

size(matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2, byrow = TRUE), 2)

# Examples from pracma size
size(1:8)

size(matrix(1:8, 2, 4))

size(matrix(1:8, 2, 4), 2)

size(matrix(1:8, 2, 4), 3)

ss <- "object"
size(ss)


## Not run: 
##D # check against GNU Octave
##D library(RcppOctave) # requires Octave (>= 3.2.4) and its development files
##D o_source(text = "
##D % Examples from GNU Octave size
##D object1 = [1, 2; 3, 4; 5, 6];
##D size(object1)
##D 
##D [nr, nc] = size([1, 2; 3, 4; 5, 6])
##D 
##D size([1, 2; 3, 4; 5, 6], 2)
##D 
##D % Examples from pracma size
##D size(1:8)
##D 
##D object2 = [1 3 5 7; 2 4 6 8];
##D 
##D size(object2)
##D 
##D size(object2, 2)
##D 
##D size(object2, 3)
##D 
##D ss = 'object';
##D size(ss)
##D ")
## End(Not run)





