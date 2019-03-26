library(descriptr)


### Name: dist_f_plot
### Title: Visualize f distribution
### Aliases: dist_f_plot f_plot dist_f_perc f_per dist_f_prob f_prob

### ** Examples

# visualize F distribution
dist_f_plot()
dist_f_plot(6, 10, normal = TRUE)

# visualize probability from a given quantile
dist_f_perc(0.95, 3, 30, 'lower')
dist_f_perc(0.125, 9, 35, 'upper')

# visualize quantiles out of given probability
dist_f_prob(2.35, 5, 32)
dist_f_prob(1.5222, 9, 35, type = "upper")




