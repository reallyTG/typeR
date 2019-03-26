library(parmsurvfit)


### Name: surv_summary
### Title: Summary statistics based on parametric distribution
### Aliases: surv_summary

### ** Examples

data("rearrest")
surv_summary(rearrest, "lnorm", time = "months")
surv_summary(rearrest, "weibull", time = "months", by = "personal")



