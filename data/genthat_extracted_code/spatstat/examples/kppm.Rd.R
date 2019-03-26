library(spatstat)


### Name: kppm
### Title: Fit Cluster or Cox Point Process Model
### Aliases: kppm kppm.formula kppm.ppp kppm.quad
### Keywords: spatial models

### ** Examples

  # method for point patterns
  kppm(redwood, ~1, "Thomas")
  # method for formulas
  kppm(redwood ~ 1, "Thomas")

  kppm(redwood ~ 1, "Thomas", method="c")
  kppm(redwood ~ 1, "Thomas", method="p")

  kppm(redwood ~ x, "MatClust") 
  kppm(redwood ~ x, "MatClust", statistic="pcf", statargs=list(stoyan=0.2)) 
  kppm(redwood ~ x, cluster="Cauchy", statistic="K")
  kppm(redwood, cluster="VarGamma", nu = 0.5, statistic="pcf")

  # LGCP models
  kppm(redwood ~ 1, "LGCP", statistic="pcf")
  if(require("RandomFields")) {
    kppm(redwood ~ x, "LGCP", statistic="pcf",
                              model="matern", nu=0.3,
                              control=list(maxit=10))
  }

  # fit with composite likelihood method
  kppm(redwood ~ x, "VarGamma", method="clik2", nu.ker=-3/8)

  # fit intensity with quasi-likelihood method
  kppm(redwood ~ x, "Thomas", improve.type = "quasi")



