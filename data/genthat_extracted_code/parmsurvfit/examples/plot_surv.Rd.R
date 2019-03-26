library(parmsurvfit)


### Name: plot_surv
### Title: Plotting parametric survival curves
### Aliases: plot_surv

### ** Examples

data("rearrest")
plot_surv(rearrest, "lnorm", time = "months")
plot_surv(rearrest, "weibull", time = "months", by = "personal")



