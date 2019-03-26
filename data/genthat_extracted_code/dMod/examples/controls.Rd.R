library(dMod)


### Name: controls
### Title: List, get and set controls for different functions
### Aliases: controls controls.objfn controls.fn controls<-
###   controls<-.objfn controls<-.fn

### ** Examples

## parfn with condition
p <- P(eqnvec(x = "-a*x"), method = "implicit", condition = "C1")
controls(p)
controls(p, "C1", "keep.root")
controls(p, "C1", "keep.root") <- FALSE

## obsfn with NULL condition
g <- Y(g = eqnvec(y = "s*x"), f = NULL, states = "x", parameters = "s")
controls(g)
controls(g, NULL, "attach.input")
controls(g, NULL, "attach.input") <- FALSE



