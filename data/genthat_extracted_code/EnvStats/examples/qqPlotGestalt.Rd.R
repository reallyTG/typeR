library(EnvStats)


### Name: qqPlotGestalt
### Title: Develop Gestalt of Q-Q Plots for Specific Distributions
### Aliases: qqPlotGestalt
### Keywords: distribution hplot

### ** Examples

  # Look at eight typical normal (Gaussian) Q-Q plots for random samples 
  # of size 10 from a N(0,1) distribution 
  # Are you surprised by the variability in the plots?
  #
  # (Note:  you must use set.seed if you want to reproduce the exact 
  #         same plots more than once.)

  set.seed(298)
  qqPlotGestalt(same.window = FALSE)

  # Add lines to these same Q-Q plots
  #----------------------------------
  set.seed(298)
  qqPlotGestalt(same.window = FALSE, add.line = TRUE)

  # Add lines to different Q-Q plots
  #---------------------------------
  qqPlotGestalt(same.window = FALSE, add.line = TRUE)

  ## Not run: 
##D   # Look at 4 sets of plots all in the same graphics window
##D   #--------------------------------------------------------
##D   qqPlotGestalt(add.line = TRUE, num.pages = 4)
##D   
## End(Not run)

  #==========

  # Look at Q-Q plots for a gamma distribution
  #-------------------------------------------

  qqPlotGestalt(dist = "gammaAlt", 
    param.list = list(mean = 10, cv = 1), 
    estimate.params = TRUE, num.pages = 3, 
    same.window = FALSE, add.line = TRUE)


  # Look at Tukey Mean Difference Q-Q plots 
  # for a gamma distribution
  #----------------------------------------

  qqPlotGestalt(dist = "gammaAlt", 
    param.list = list(mean = 10, cv = 1), 
    estimate.params = TRUE, num.pages = 3, 
    plot.type = "Tukey", same.window = FALSE, add.line = TRUE)

  #==========

  # Clean up
  #---------
  graphics.off()



