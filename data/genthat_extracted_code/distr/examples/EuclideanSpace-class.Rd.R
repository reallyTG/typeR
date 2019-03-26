library(distr)


### Name: EuclideanSpace-class
### Title: Class "EuclideanSpace"
### Aliases: EuclideanSpace EuclideanSpace-class
###   initialize,EuclideanSpace-method
### Keywords: distribution

### ** Examples

E <- EuclideanSpace(dimension = 2) 
dimension(E) # The dimension of this space is 2.
dimension(E) <- 3 # The dimension of this space is now 3.
liesIn(E,c(0,0,0)) # TRUE
liesIn(E,c(0,0)) # FALSE



