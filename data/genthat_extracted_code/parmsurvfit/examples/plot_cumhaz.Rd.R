library(parmsurvfit)


### Name: plot_cumhaz
### Title: Plotting parametric cumulative hazard curves
### Aliases: plot_cumhaz

### ** Examples

data("rearrest")
plot_cumhaz(rearrest, "lnorm", time = "months")
plot_cumhaz(rearrest, "weibull", time = "months", by = "personal")



