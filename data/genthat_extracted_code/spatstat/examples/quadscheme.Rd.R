library(spatstat)


### Name: quadscheme
### Title: Generate a Quadrature Scheme from a Point Pattern
### Aliases: quadscheme
### Keywords: spatial datagen

### ** Examples

  data(simdat)

  # grid weights
  Q <- quadscheme(simdat)
  Q <- quadscheme(simdat, method="grid")
  Q <- quadscheme(simdat, eps=0.5)         # dummy point spacing 0.5 units

  Q <- quadscheme(simdat, nd=50)           # 1 dummy point per tile
  Q <- quadscheme(simdat, ntile=25, nd=50) # 4 dummy points per tile

  # Dirichlet weights
  Q <- quadscheme(simdat, method="dirichlet", exact=FALSE)

  # random dummy pattern
  ## Not run: 
##D   D <- runifpoint(250, Window(simdat))
##D   Q <- quadscheme(simdat, D, method="dirichlet", exact=FALSE)
##D   
## End(Not run)

  # polygonal window
  data(demopat)
  X <- unmark(demopat)
  Q <- quadscheme(X)

  # mask window
  Window(X) <- as.mask(Window(X))
  Q <- quadscheme(X)
  



