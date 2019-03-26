library(skpr)


### Name: plot_correlations
### Title: Plots design diagnostics
### Aliases: plot_correlations

### ** Examples

#We can pass either the output of gen_design or eval_design to plot_correlations
#in order to obtain the correlation map. Passing the output of eval_design is useful
#if you want to plot the correlation map from an externally generated design.

#First generate the design:

candidatelist = expand.grid(cost = c(15000, 20000), year = c("2001", "2002", "2003", "2004"),
                           type = c("SUV", "Sedan", "Hybrid"))
cardesign = gen_design(candidatelist, ~(cost+type+year)^2, 30)
plot_correlations(cardesign)

#We can also increase the level of interactions that are shown by default.

plot_correlations(cardesign, pow = 3)

#You can also pass in a custom color map.
plot_correlations(cardesign, customcolors = c("blue", "grey", "red"))
plot_correlations(cardesign, customcolors = c("blue", "green", "yellow", "orange", "red"))



