library(parmsurvfit)


### Name: plot_density
### Title: Plotting density function overlayed on top of a histogram of
###   data
### Aliases: plot_density

### ** Examples

data("rearrest")
plot_density(rearrest, "exp", time = "months")
plot_density(rearrest, "weibull", time = "months", by = "personal")



