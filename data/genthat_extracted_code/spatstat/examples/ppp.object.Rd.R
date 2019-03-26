library(spatstat)


### Name: ppp.object
### Title: Class of Point Patterns
### Aliases: ppp.object
### Keywords: spatial attribute

### ** Examples

  x <- runif(100)
  y <- runif(100)
  X <- ppp(x, y, c(0,1),c(0,1))
  X
  ## Not run: plot(X)
  mar <- sample(1:3, 100, replace=TRUE)
  mm <- ppp(x, y, c(0,1), c(0,1), marks=mar)
  ## Not run: plot(mm)
  # points with mark equal to 2
  ss <- mm[ mm$marks == 2 , ]
  ## Not run: plot(ss)
  # left half of pattern 'mm'
  lu <- owin(c(0,0.5),c(0,1))
  mmleft <- mm[ , lu]
  ## Not run: plot(mmleft)
  ## Not run: 
##D   if(FALSE) {
##D   # input data from file
##D   qq <- scanpp("my.table", unit.square())
##D 
##D   # interactively build a point pattern
##D   plot(unit.square())
##D   X <- as.ppp(locator(10), unit.square())
##D   plot(X)
##D   }
##D  
## End(Not run)



