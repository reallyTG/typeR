library(eesim)


### Name: calendar_plot
### Title: Create calendar plot
### Aliases: calendar_plot

### ** Examples

testdat <- sim_exposure(n = 1000, central = 0.1,
           exposure_type = "binary")
testdat$x[c(89,101,367,500,502,598,678,700,895)] <- 3
calendar_plot(testdat, type = "discrete", labels = c("no", "yes", "maybe"))




