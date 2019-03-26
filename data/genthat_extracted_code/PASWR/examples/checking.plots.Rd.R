library(PASWR)


### Name: checking.plots
### Title: Checking Plots
### Aliases: checking.plots
### Keywords: regression

### ** Examples

# Figure 11.10
mod.aov <- aov(StopDist~tire, data = Tire)
checking.plots(mod.aov) 
rm(mod.aov)



