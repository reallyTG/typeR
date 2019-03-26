library(parsnip)


### Name: svm_rbf
### Title: General interface for radial basis function support vector
###   machines
### Aliases: svm_rbf update.svm_rbf

### ** Examples

svm_rbf(mode = "classification", rbf_sigma = 0.2)
# Parameters can be represented by a placeholder:
svm_rbf(mode = "regression", cost = varying())
model <- svm_rbf(cost = 10, rbf_sigma = 0.1)
model
update(model, cost = 1)
update(model, cost = 1, fresh = TRUE)



