library(parmsurvfit)


### Name: plot_haz
### Title: Plotting parametric hazard curves
### Aliases: plot_haz

### ** Examples

data("rearrest")
plot_haz(rearrest, "logis", time = "months")
plot_haz(rearrest, "weibull", time = "months", by = "personal")



