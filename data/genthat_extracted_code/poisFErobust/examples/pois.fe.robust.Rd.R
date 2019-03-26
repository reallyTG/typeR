library(poisFErobust)


### Name: pois.fe.robust
### Title: Robust standard errors of Poisson fixed effects regression
### Aliases: pois.fe.robust
### Keywords: regression

### ** Examples

# ex.dt.good satisfies the conditional mean assumption
data("ex.dt.good")
pois.fe.robust(outcome = "y", xvars = c("x1", "x2"), group.name = "id",
               index.name = "id", data = ex.dt.good)
               
# ex.dt.bad violates the conditional mean assumption
data("ex.dt.bad")
pois.fe.robust(outcome = "y", xvars = c("x1", "x2"), group.name = "id",
               index.name = "id", data = ex.dt.bad)



