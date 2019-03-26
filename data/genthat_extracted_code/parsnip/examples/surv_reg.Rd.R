library(parsnip)


### Name: surv_reg
### Title: General Interface for Parametric Survival Models
### Aliases: surv_reg update.surv_reg

### ** Examples

surv_reg()
# Parameters can be represented by a placeholder:
surv_reg(dist = varying())

model <- surv_reg(dist = "weibull")
model
update(model, dist = "lnorm")



