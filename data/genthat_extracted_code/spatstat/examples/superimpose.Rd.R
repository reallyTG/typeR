library(spatstat)


### Name: superimpose
### Title: Superimpose Several Geometric Patterns
### Aliases: superimpose superimpose.ppp superimpose.splitppp
###   superimpose.ppplist superimpose.psp superimpose.default
### Keywords: spatial manip

### ** Examples

  # superimposing point patterns
  p1  <- runifrect(30)
  p2  <- runifrect(42)
  s1  <- superimpose(p1,p2) # Unmarked pattern.
  p3  <- list(x=rnorm(20),y=rnorm(20))
  s2  <- superimpose(p3,p2,p1) # Default method gets called.
  s2a <- superimpose(p1,p2,p3) # Same as s2 except for order of points.
  s3  <- superimpose(clyde=p1,irving=p2) # Marked pattern; marks a factor
                                         # with levels "clyde" and "irving";
                                         # warning given.
  marks(p1) <- factor(sample(LETTERS[1:3],30,TRUE))
  marks(p2) <- factor(sample(LETTERS[1:3],42,TRUE))
  s5  <- superimpose(clyde=p1,irving=p2) # Marked pattern with extra column
  marks(p2) <- data.frame(a=marks(p2),b=runif(42))
  s6  <- try(superimpose(p1,p2)) # Gives an error.
  marks(p1) <- data.frame(a=marks(p1),b=1:30)
  s7  <- superimpose(p1,p2) # O.K.

  # how to make a 2-type point pattern with types "a" and "b"
  u <- superimpose(a = rpoispp(10), b = rpoispp(20))

  # how to make a 2-type point pattern with types 1 and 2
  u <- superimpose("1" = rpoispp(10), "2" = rpoispp(20))
 
  # superimposing line segment patterns
  X <- rpoisline(10)
  Y <- as.psp(matrix(runif(40), 10, 4), window=owin())
  Z <- superimpose(X, Y)

  # being unreasonable
  ## Not run: 
##D    if(FALSE) {
##D     crud <- try(superimpose(p1,p2,X,Y)) # Gives an error, of course!
##D    }
##D   
## End(Not run)



