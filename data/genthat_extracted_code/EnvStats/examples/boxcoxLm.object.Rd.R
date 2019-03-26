library(EnvStats)


### Name: boxcoxLm.object
### Title: S3 Class "boxcoxLm"
### Aliases: boxcoxLm.object
### Keywords: classes

### ** Examples

  # Create an object of class "boxcoxLm", then print it out.

  # The data frame Environmental.df contains daily measurements of 
  # ozone concentration, wind speed, temperature, and solar radiation
  # in New York City for 153 consecutive days between May 1 and 
  # September 30, 1973.  In this example, we'll plot ozone vs. 
  # temperature and look at the Q-Q plot of the residuals.  Then 
  # we'll look at possible Box-Cox transformations.  The "optimal" one 
  # based on the PPCC looks close to a log-transformation 
  # (i.e., lambda=0).  The power that produces the largest PPCC is 
  # about 0.2, so a cube root (lambda=1/3) transformation might work too.

  # Fit the model with the raw Ozone data
  #--------------------------------------
  ozone.fit <- lm(ozone ~ temperature, data = Environmental.df) 

  # Plot Ozone vs. Temperature, with fitted line 
  #---------------------------------------------
  dev.new()
  with(Environmental.df, 
    plot(temperature, ozone, xlab = "Temperature (degrees F)",
      ylab = "Ozone (ppb)", main = "Ozone vs. Temperature"))
  abline(ozone.fit) 

  # Look at the Q-Q Plot for the residuals 
  #---------------------------------------
  dev.new()
  qqPlot(ozone.fit$residuals, add.line = TRUE) 

  # Look at Box-Cox transformations of Ozone 
  #-----------------------------------------
  boxcox.list <- boxcox(ozone.fit) 
  boxcox.list 
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Linear Model:                    ozone.fit
  #
  #Sample Size:                     116
  #
  # lambda      PPCC
  #   -2.0 0.4286781
  #   -1.5 0.4673544
  #   -1.0 0.5896132
  #   -0.5 0.8301458
  #    0.0 0.9871519
  #    0.5 0.9819825
  #    1.0 0.9408694
  #    1.5 0.8840770
  #    2.0 0.8213675

  #----------

  # Clean up
  #---------
  rm(ozone.fit, boxcox.list)



