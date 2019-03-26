library(rstanarm)


### Name: plot.survfit.stanjm
### Title: Plot the estimated subject-specific or marginal survival
###   function
### Aliases: plot.survfit.stanjm plot_stack_jm

### ** Examples

## No test: 
  # Run example model if not already loaded
  if (!exists("example_jm")) example(example_jm)
  
  # Obtain subject-specific conditional survival probabilities
  # for all individuals in the estimation dataset.
  ps1 <- posterior_survfit(example_jm, extrapolate = TRUE)
  
  # We then plot the conditional survival probabilities for
  # a subset of individuals
  plot(ps1, ids = c(7,13,15))
  # We can change or add attributes to the plot
  plot(ps1, ids = c(7,13,15), limits = "none")
  plot(ps1, ids = c(7,13,15), xlab = "Follow up time")
  plot(ps1, ids = c(7,13,15), ci_geom_args = list(fill = "red"),
       color = "blue", linetype = 2)
  plot(ps1, ids = c(7,13,15), facet_scales = "fixed")
  
  # Since the returned plot is also a ggplot object, we can
  # modify some of its attributes after it has been returned
  plot1 <- plot(ps1, ids = c(7,13,15))
  plot1 + 
    ggplot2::theme(strip.background = ggplot2::element_blank()) +
    ggplot2::coord_cartesian(xlim = c(0, 15)) +
    ggplot2::labs(title = "Some plotted survival functions")
    
  # We can also combine the plot(s) of the estimated 
  # subject-specific survival functions, with plot(s) 
  # of the estimated longitudinal trajectories for the
  # same individuals
  ps1 <- posterior_survfit(example_jm, ids = c(7,13,15))
  pt1 <- posterior_traj(example_jm, , ids = c(7,13,15))
  plot_surv <- plot(ps1) 
  plot_traj <- plot(pt1, vline = TRUE, plot_observed = TRUE)
  plot_stack_jm(plot_traj, plot_surv)
   
  # Lastly, let us plot the standardised survival function
  # based on all individuals in our estimation dataset
  ps2 <- posterior_survfit(example_jm, standardise = TRUE, times = 0,
                          control = list(epoints = 20))
  plot(ps2)   
## End(No test)
   
## No test: 
  if (!exists("example_jm")) example(example_jm)
  ps1 <- posterior_survfit(example_jm, ids = c(7,13,15))
  pt1 <- posterior_traj(example_jm, ids = c(7,13,15), extrapolate = TRUE)
  plot_surv <- plot(ps1) 
  plot_traj <- plot(pt1, vline = TRUE, plot_observed = TRUE)
  plot_stack_jm(plot_traj, plot_surv)
## End(No test)
 



