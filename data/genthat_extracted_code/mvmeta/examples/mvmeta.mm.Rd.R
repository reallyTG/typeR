library(mvmeta)


### Name: mvmeta.mm
### Title: Method of Moments Estimator for mvmeta Models
### Aliases: mvmeta.mm
### Keywords: models regression multivariate

### ** Examples

# MM ESTIMATOR: UNIVARIATE MODEL
model <- mvmeta(PD~pubyear,S=berkey98[,5],data=berkey98,method="mm")
summary(model)

# MM ESTIMATOR: REPRODUCE THE RESULTS IN CHEN ET AL. (2012)
S <- as.matrix(hsls[5:10])
model <- mvmeta(cbind(b1,b2,b3),S,data=hsls,method="mm")
summary(model)

# MM ESTIMATOR: REPRODUCE THE RESULTS IN JACKSON ET AL. (2013)
S <- inputcov(hyp[c("sbp_se","dbp_se")],cor=hyp$rho)
model <- mvmeta(cbind(sbp,dbp),S=S,data=hyp,method="mm")
summary(model)



