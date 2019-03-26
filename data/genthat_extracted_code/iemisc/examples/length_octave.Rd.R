library(iemisc)


### Name: length_octave
### Title: Length of R objects (GNU Octave/MATLAB compatible)
### Aliases: length_octave

### ** Examples

library(iemisc)
import::from(pracma, ones)
# Example from pracma isempty
object1 <- matrix(0, 1, 0)
length_octave(object1)

object2 <- 2
length_octave(object2)

object3 <- 1:10
length_octave(object3)

object4 <- ones(3, 4)
length_octave(object4)

object5 <- "ss"
length_octave(object5)

object6 <- list(letters, b <- 2)
length_octave(object6)


## Not run: 
##D # check against GNU Octave
##D library(RcppOctave) # requires Octave (>= 3.2.4) and its development files
##D o_source(text = "
##D object1 = [];
##D length(object1)
##D 
##D object2 = 2;
##D length(object2)
##D 
##D object3 = 1:10;
##D length(object3)
##D 
##D object4 = ones(3, 4);
##D length(object4)
##D 
##D object5 = 'ss';
##D length(object5)
##D ")
## End(Not run)





