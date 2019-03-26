library(EnvStats)


### Name: plot.boxcox
### Title: Plot Results of Box-Cox Transformations
### Aliases: plot.boxcox
### Keywords: plot

### ** Examples

  # Generate 30 observations from a lognormal distribution with 
  # mean=10 and cv=2, call the function boxcox, and then plot 
  # the results.  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rlnormAlt(30, mean = 10, cv = 2) 

  # Plot the results based on the PPCC objective
  #---------------------------------------------
  boxcox.list <- boxcox(x)
  dev.new()
  plot(boxcox.list)

  # Look at Q-Q Plots for the candidate values of lambda
  #-----------------------------------------------------
  plot(boxcox.list, plot.type = "Q-Q Plots", same.window = FALSE) 


  # Look at Tukey Mean-Difference Q-Q Plots 
  # for the candidate values of lambda
  #----------------------------------------
  plot(boxcox.list, plot.type = "Tukey M-D Q-Q Plots", same.window = FALSE) 

  #==========

  # Clean up
  #---------
  rm(x, boxcox.list)
  graphics.off()



