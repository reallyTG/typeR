library(parmsurvfit)


### Name: fit_data
### Title: Fitting right censored survival data to distribution
### Aliases: fit_data

### ** Examples

data("rearrest")
fit_data(rearrest, "lnorm", time = "months")

fit_data(rearrest, "weibull", time = "months", by = "personal")




