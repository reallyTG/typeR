library(mousetrap)


### Name: mt_plot_riverbed
### Title: Plot density of mouse positions across time steps.
### Aliases: mt_plot_riverbed

### ** Examples

# Time-normalize trajectories
KH2017 <- mt_time_normalize(KH2017)
  
# Create riverbed plot for all trials
mt_plot_riverbed(KH2017)

## Not run: 
##D # Create separate plots for typical and atypical trials
##D mt_plot_riverbed(mt_example, facet_col="Condition")
##D 
##D 
##D # Create riverbed plot for all trials with custom x and y axis labels
##D mt_plot_riverbed(mt_example) +
##D   ggplot2::xlab("Time step") + ggplot2::ylab("X coordinate")
##D 
##D # Note that it is also possible to replace the
##D # default scale for fill with a custom scale
##D mt_plot_riverbed(mt_example, facet_col="Condition") +
##D   ggplot2::scale_fill_gradientn(colours=grDevices::heat.colors(9),
##D     name="Frequency", trans="log", labels=scales::percent)
## End(Not run)




