library(mvmeta)


### Name: mvmeta.fixed
### Title: Fixed-Effects Estimator for mvmeta Models
### Aliases: mvmeta.fixed
### Keywords: models regression multivariate

### ** Examples

# UNIVARIATE FIXED-EFFECTS MODEL
model <- mvmeta(yC,S=SCC,data=smoking,method="fixed")
summary(model)

# MULTIVARIATE FIXED-EFFECTS MODEL
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S,method="fixed")
summary(model)

# MULTIVARIATE FIXED-EFFECTS MODEL: REPLICATE THE RESULTS IN BERKEY ET AL. 1998
model <- mvmeta(cbind(PD,AL)~I(pubyear-1983),S=berkey98[5:7],
  data=berkey98,method="fixed")
summary(model)



