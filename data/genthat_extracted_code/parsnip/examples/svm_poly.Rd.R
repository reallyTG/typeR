library(parsnip)


### Name: svm_poly
### Title: General interface for polynomial support vector machines
### Aliases: svm_poly update.svm_poly

### ** Examples

svm_poly(mode = "classification", degree = 1.2)
# Parameters can be represented by a placeholder:
svm_poly(mode = "regression", cost = varying())
model <- svm_poly(cost = 10, scale_factor = 0.1)
model
update(model, cost = 1)
update(model, cost = 1, fresh = TRUE)



