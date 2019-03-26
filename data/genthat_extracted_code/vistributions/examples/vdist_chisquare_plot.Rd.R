library(vistributions)


### Name: vdist_chisquare_plot
### Title: Visualize chi square distribution
### Aliases: vdist_chisquare_plot vdist_chisquare_perc vdist_chisquare_prob

### ** Examples

# visualize chi square distribution
vdist_chisquare_plot()
vdist_chisquare_plot(df = 5)
vdist_chisquare_plot(df = 5, normal = TRUE)

# visualize quantiles out of given probability
vdist_chisquare_perc(0.165, 8, 'lower')
vdist_chisquare_perc(0.22, 13, 'upper')

# visualize probability from a given quantile.
vdist_chisquare_prob(13.58, 11, 'lower')
vdist_chisquare_prob(15.72, 13, 'upper')




