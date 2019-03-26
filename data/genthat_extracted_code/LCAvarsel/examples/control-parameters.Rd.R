library(LCAvarsel)


### Name: control-parameters
### Title: Set control parameters for various purposes
### Aliases: controlLCA controlReg controlGA

### ** Examples

data(carcinoma, package = "poLCA")
# increase number of replicates and decrease tolerance value
fit <- fitLCA(carcinoma, ctrlLCA = controlLCA(nrep = 10, tol = 1e-07))



