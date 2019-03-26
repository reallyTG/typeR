library(emulator)


### Name: corr
### Title: correlation function for calculating A
### Aliases: corr corr.matrix
### Keywords: models

### ** Examples


jj <- latin.hypercube(2,10)
x1 <- jj[1,]
x2 <- jj[2,]

corr(x1,x2,scales=rep(1,10))             # correlation between 2 points
corr(x1,x2,pos.def.matrix=0.1+diag(10))  # see effect of offdiagonal elements

x <- latin.hypercube(4,7)                # 4 points in 7-dimensional space
rownames(x) <- letters[1:4]              # name the points

corr.matrix(x,scales=rep(1,7))

x[1,1] <- 100                            # make the first point far away
corr.matrix(x,scales=rep(1,7))

# note that all the first row and first column apart from element [1,1]
# is zero (or very nearly so) because the first point is now very far
# from the other points and has zero correlation with them.

# To use just a single dimension, remember to use the drop=FALSE argument:
corr.matrix(x[,1,drop=FALSE],scales=rep(1,1))


# For problems in 1D, coerce the independent variable to a matrix:
m <- c(0.2, 0.4, 0.403, 0.9)
corr.matrix(cbind(m),scales=1)


# now use a non-default value for distance.function.
# Function f() below taken from Jeremy Oakley's thesis page 12,
# equation 2.10:

f <- function(x,y,theta){
  d <- sum(abs(x-y))
  if(d >= theta){
    return(0)
  }else{
    return(1-d/theta)
  }
}


corr.matrix(xold=x, distance.function=f, method=2, theta=4)

 # Note the first row and first column is a single 1 and 3 zeros
 # (because the first point, viz x[1,], is "far" from the other points).
 # Also note the method=2 argument here; method=1 is the fast slick
 # matrix method suggested by Doug and Jeremy, but this only works
 # for distance.function=corr.






