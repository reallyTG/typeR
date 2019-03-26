library(EnvStats)


### Name: plot.boxcoxLm
### Title: Plot Results of Box-Cox Transformations for a Linear Model
### Aliases: plot.boxcoxLm
### Keywords: plot

### ** Examples

  # Create an object of class "boxcoxLm", then plot the results.

  # The data frame Environmental.df contains daily measurements of 
  # ozone concentration, wind speed, temperature, and solar radiation
  # in New York City for 153 consecutive days between May 1 and 
  # September 30, 1973.  In this example, we'll model ozone as a 
  # function of temperature.

  # Fit the model with the raw Ozone data
  #--------------------------------------
  ozone.fit <- lm(ozone ~ temperature, data = Environmental.df) 

  boxcox.list <- boxcox(ozone.fit)

  # Plot PPCC vs. lambda based on Q-Q plots of residuals 
  #-----------------------------------------------------
  dev.new()
  plot(boxcox.list) 

  # Look at Q-Q plots of residuals for the various transformation 
  #--------------------------------------------------------------
  plot(boxcox.list, plot.type = "Q-Q Plots", same.window = FALSE)


  # Look at Tukey Mean-Difference Q-Q plots of residuals 
  # for the various transformation 
  #-----------------------------------------------------
  plot(boxcox.list, plot.type = "Tukey M-D Q-Q Plots", same.window = FALSE)

  #==========

  # Clean up
  #---------
  rm(ozone.fit, boxcox.list)
  graphics.off()



