library(poisFErobust)


### Name: poisFErobust-package
### Title: Poisson Fixed Effects Robust
### Aliases: poisFErobust-package poisFErobust
### Keywords: package regression

### ** Examples

# ex.dt.good satisfies the conditional mean assumption
data("ex.dt.good")
pois.fe.robust(outcome = "y", xvars = c("x1", "x2"), group.name = "id",
               index.name = "id", data = ex.dt.good)
               
# ex.dt.bad violates the conditional mean assumption
data("ex.dt.bad")
pois.fe.robust(outcome = "y", xvars = c("x1", "x2"), group.name = "id",
               index.name = "id", data = ex.dt.bad)



