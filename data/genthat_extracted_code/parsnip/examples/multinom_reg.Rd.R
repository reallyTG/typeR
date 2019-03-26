library(parsnip)


### Name: multinom_reg
### Title: General Interface for Multinomial Regression Models
### Aliases: multinom_reg update.multinom_reg

### ** Examples

multinom_reg()
# Parameters can be represented by a placeholder:
multinom_reg(penalty = varying())
model <- multinom_reg(penalty = 10, mixture = 0.1)
model
update(model, penalty = 1)
update(model, penalty = 1, fresh = TRUE)



