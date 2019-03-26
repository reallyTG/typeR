library(vistributions)


### Name: vdist_f_plot
### Title: Visualize f distribution
### Aliases: vdist_f_plot vdist_f_perc vdist_f_prob

### ** Examples

# visualize F distribution
vdist_f_plot()
vdist_f_plot(6, 10, normal = TRUE)

# visualize probability from a given quantile
vdist_f_perc(0.95, 3, 30, 'lower')
vdist_f_perc(0.125, 9, 35, 'upper')

# visualize quantiles out of given probability
vdist_f_prob(2.35, 5, 32)
vdist_f_prob(1.5222, 9, 35, type = "upper")




