library(mvmeta)


### Name: mvmeta.vc
### Title: Variance Components Estimator for mvmeta Models
### Aliases: mvmeta.vc
### Keywords: models regression multivariate

### ** Examples

# VC ESTIMATOR: UNIVARIATE MODEL
model <- mvmeta(PD~pubyear,S=berkey98[,5],data=berkey98,method="vc")
summary(model)

# VC ESTIMATOR: MULTIVARIATE MODEL
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98,method="vc")
summary(model)

# VC ESTIMATOR: NON-ITERATIVE VERSION
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98,method="vc",
  control=list(maxiter=1))
summary(model)

# VARIANCE COMPONENTS ESTIMATOR: REPLICATE THE RESULTS IN BERKEY ET AL. (1998)
model <- mvmeta(cbind(PD,AL)~I(pubyear-1983),S=berkey98[5:7],
  data=berkey98,method="vc",control=list(vc.adj=FALSE))
summary(model)



