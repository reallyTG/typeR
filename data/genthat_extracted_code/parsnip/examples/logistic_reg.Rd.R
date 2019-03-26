library(parsnip)


### Name: logistic_reg
### Title: General Interface for Logistic Regression Models
### Aliases: logistic_reg update.logistic_reg

### ** Examples

logistic_reg()
# Parameters can be represented by a placeholder:
logistic_reg(penalty = varying())
model <- logistic_reg(penalty = 10, mixture = 0.1)
model
update(model, penalty = 1)
update(model, penalty = 1, fresh = TRUE)



