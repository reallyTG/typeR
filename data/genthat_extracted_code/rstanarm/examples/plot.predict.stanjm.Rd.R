library(rstanarm)


### Name: plot.predict.stanjm
### Title: Plot the estimated subject-specific or marginal longitudinal
###   trajectory
### Aliases: plot.predict.stanjm

### ** Examples

## No test: 
  # Run example model if not already loaded
  if (!exists("example_jm")) example(example_jm)
  
  # For a subset of individuals in the estimation dataset we will
  # obtain subject-specific predictions for the longitudinal submodel 
  # at evenly spaced times between 0 and their event or censoring time.
  pt1 <- posterior_traj(example_jm, ids = c(7,13,15), interpolate = TRUE)
  plot(pt1)                  # credible interval for mean response
  plot(pt1, limits = "pi")   # prediction interval for raw response
  plot(pt1, limits = "none") # no uncertainty interval
  
  # We can also extrapolate the longitudinal trajectories.
  pt2 <- posterior_traj(example_jm, ids = c(7,13,15), interpolate = TRUE,
                        extrapolate = TRUE)
  plot(pt2)
  plot(pt2, vline = TRUE)    # add line indicating event or censoring time
  plot(pt2, vline = TRUE, plot_observed = TRUE)  # overlay observed longitudinal data
 
  # We can change or add attributes to the plot
  plot1 <- plot(pt2, ids = c(7,13,15), xlab = "Follow up time",
                     vline = TRUE, plot_observed = TRUE, 
                     facet_scales = "fixed", color = "blue", linetype = 2,
                     ci_geom_args = list(fill = "red"))
  plot1
       
  # Since the returned plot is also a ggplot object, we can
  # modify some of its attributes after it has been returned
  plot1 + 
    ggplot2::theme(strip.background = ggplot2::element_blank()) +
    ggplot2::labs(title = "Some plotted longitudinal trajectories")
## End(No test)



