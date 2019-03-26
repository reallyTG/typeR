library(parmsurvfit)


### Name: surv_prob
### Title: Survival probability based on parametric distribution
### Aliases: surv_prob

### ** Examples

data("rearrest")
surv_prob(rearrest, "lnorm", 110, time = "months")
surv_prob(rearrest, "weibull", 90, time = "months", lower.tail = TRUE)



