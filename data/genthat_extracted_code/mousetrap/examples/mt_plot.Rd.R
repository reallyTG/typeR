library(mousetrap)


### Name: mt_plot
### Title: Plot trajectory data.
### Aliases: mt_plot mt_plot_aggregate

### ** Examples

# Load ggplot2
library(ggplot2)


## Plot individual example trajectories

# Time-normalize trajectories
mt_example <- mt_time_normalize(mt_example)

# Plot all time-normalized trajectories
# varying the color depending on the condition
mt_plot(mt_example, use="tn_trajectories",
  color="Condition")

# ... with custom colors
mt_plot(mt_example, use="tn_trajectories",
  color="Condition") +
  ggplot2::scale_color_brewer(type="qual")

# Create separate plots per Condition
mt_plot(mt_example, use="tn_trajectories",
  facet_col="Condition")

# Plot velocity profiles based on the averaged trajectories
# varying the color depending on the condition
mt_example <- mt_derivatives(mt_example)
mt_example <- mt_average(mt_example, interval_size = 100)
mt_plot(mt_example, use="av_trajectories",
  x="timestamps", y="vel", color="Condition")


## Plot aggregate trajectories for KH2017 data

# Time-normalize trajectories
KH2017 <- mt_time_normalize(KH2017)

# Plot aggregated time-normalized trajectories per condition
mt_plot_aggregate(KH2017, use="tn_trajectories",
  color="Condition")

# ... first aggregating trajectories within subjects
mt_plot_aggregate(KH2017, use="tn_trajectories",
  color="Condition", subject_id="subject_nr")

# ... adding points for each position to the plot
mt_plot_aggregate(KH2017, use="tn_trajectories",
  color="Condition", points=TRUE)

## Not run: 
##D # Create customized aggregate trajectory plot
##D # by using only_ggplot option to return a ggplot object without geoms
##D # and by adding a geom to it with a custom line width
##D mt_plot_aggregate(KH2017, use="tn_trajectories",
##D   color="Condition", only_ggplot=TRUE) + 
##D   geom_path(size=1.5)
##D   
##D # Create customized plot of individual trajectories
##D # by using only_ggplot option to return a ggplot object without geoms
##D # and by adding a geom to it with semitransparent lines 
##D # (by specifying alpha < 1)
##D mt_plot(KH2017, use="tn_trajectories", only_ggplot=TRUE) + 
##D   geom_path(alpha=0.2)
## End(Not run)




