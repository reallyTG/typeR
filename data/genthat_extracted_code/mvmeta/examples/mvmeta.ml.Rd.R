library(mvmeta)


### Name: mvmeta.ml
### Title: ML and REML Estimators for mvmeta Models
### Aliases: mvmeta.ml mvmeta.reml
### Keywords: models regression multivariate

### ** Examples

# REML ESTIMATOR: UNIVARIATE MODEL
model <- mvmeta(yC,S=SCC,data=smoking)
summary(model)

# REML ESTIMATOR: REPRODUCE THE RESULTS IN WHITE (2011)
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S)
summary(model)

# ML ESTIMATOR: REPRODUCE THE RESULTS IN BERKEY ET AL. (1998)
year <- berkey98$pubyear - 1983
model <- mvmeta(cbind(PD,AL)~year,S=berkey98[5:7],data=berkey98,method="ml")
print(summary(model),digits=3)
round(model$Psi,3)

# UNSTRUCTURED AND STRUCTURED BETWEEN-STUDY (CO)VARIANCE
y <- as.matrix(fibrinogen[2:5])
S <- as.matrix(fibrinogen[6:15])
model <- mvmeta(y,S)
summary(model)
model <- mvmeta(y,S,bscov="diag")
summary(model)
model <- mvmeta(y,S,bscov="hcs")
summary(model)

# SEE help(mvmetaCovStruct) for additional info and examples



