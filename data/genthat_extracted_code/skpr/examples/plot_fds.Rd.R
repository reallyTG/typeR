library(skpr)


### Name: plot_fds
### Title: Plots design diagnostics
### Aliases: plot_fds

### ** Examples

#We can pass either the output of gen_design or eval_design to plot_correlations
#in order to obtain the correlation map. Passing the output of eval_design is useful
#if you want to plot the correlation map from an externally generated design.

#First generate the design:

candidatelist = expand.grid(X1 = c(1, -1), X2 = c(1, -1))

design = gen_design(candidatelist, ~(X1 + X2), 15)

plot_fds(design)



