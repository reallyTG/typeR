library(iemisc)


### Name: numel
### Title: Number of elements (GNU Octave/MATLAB compatible)
### Aliases: numel

### ** Examples

library(iemisc)
import::from(pracma, ones)
xx <- list(1:26, 1:10)
numel(xx)

# Examples from GNU Octave numel
a <- 1
b <- ones(2, 3)
numel(a, b)

a <- 2
b <- ones(2, 3)
c <- ones(3, 4)
numel(a, b)
numel(a, b, c)

f <- matrix(c(10, 12, 23, 21, 62, 93), nrow = 2, ncol = 3, byrow = TRUE)
g <- c(2, 4)
numel(f, g)


## Not run: 
##D # check against GNU Octave
##D library(RcppOctave) # requires Octave (>= 3.2.4) and its development files
##D o_source(text = "
##D xx = {1:26, 1:10}
##D 
##D % Examples from GNU Octave numel
##D a = 1;
##D b = ones(2, 3);
##D numel(a, b)
##D 
##D a = 2;
##D b = ones(2, 3);
##D c = ones(3, 4);
##D numel(a, b)
##D numel(a, b, c)
##D 
##D f = [10 12 23; 21 62 93];
##D g = [2 4];
##D numel(f, g)
##D ")
## End(Not run)





