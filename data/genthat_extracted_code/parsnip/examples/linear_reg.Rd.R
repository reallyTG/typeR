library(parsnip)


### Name: linear_reg
### Title: General Interface for Linear Regression Models
### Aliases: linear_reg update.linear_reg

### ** Examples

linear_reg()
# Parameters can be represented by a placeholder:
linear_reg(penalty = varying())
model <- linear_reg(penalty = 10, mixture = 0.1)
model
update(model, penalty = 1)
update(model, penalty = 1, fresh = TRUE)



