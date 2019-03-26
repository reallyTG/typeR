library(descriptr)


### Name: dist_chi_plot
### Title: Visualize chi square distribution
### Aliases: dist_chi_plot chi_plot dist_chi_perc chi_per dist_chi_prob
###   chi_prob

### ** Examples

# visualize chi square distribution
dist_chi_plot()
dist_chi_plot(df = 5)
dist_chi_plot(df = 5, normal = TRUE)

# visualize quantiles out of given probability
dist_chi_perc(0.165, 8, 'upper')
dist_chi_perc(0.22, 13, 'upper')

# visualize probability from a given quantile.
dist_chi_prob(13.58, 11, 'lower')
dist_chi_prob(15.72, 13, 'upper')




