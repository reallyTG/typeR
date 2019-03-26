library(EnvStats)


### Name: boxcox
### Title: Boxcox Power Transformation
### Aliases: boxcox boxcox.default boxcox.lm Box-Cox BoxCox 'Box-Cox
###   Transformation' 'BoxCox Transformation'
### Keywords: univar models

### ** Examples

  # Generate 30 observations from a lognormal distribution with 
  # mean=10 and cv=2.  Look at some values of various objectives 
  # for various transformations.  Note that for both the PPCC and 
  # the Log-Likelihood objective, the optimal value of lambda is 
  # about 0, indicating that a log transformation is appropriate.  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rlnormAlt(30, mean = 10, cv = 2) 

  dev.new()
  hist(x, col = "cyan")

  # Using the PPCC objective:
  #--------------------------

  boxcox(x) 
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Sample Size:                     30
  #
  # lambda      PPCC
  #   -2.0 0.5423739
  #   -1.5 0.6402782
  #   -1.0 0.7818160
  #   -0.5 0.9272219
  #    0.0 0.9921702
  #    0.5 0.9581178
  #    1.0 0.8749611
  #    1.5 0.7827009
  #    2.0 0.7004547

  boxcox(x, optimize = TRUE)
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Sample Size:                     30
  #
  #Bounds for Optimization:         lower = -2
  #                                 upper =  2
  #
  #Optimal Value:                   lambda = 0.04530789
  #
  #Value of Objective:              PPCC = 0.9925919


  # Using the Log-Likelihodd objective
  #-----------------------------------

  boxcox(x, objective.name = "Log-Likelihood") 
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  Log-Likelihood
  #
  #Data:                            x
  #
  #Sample Size:                     30
  #
  # lambda Log-Likelihood
  #   -2.0     -154.94255
  #   -1.5     -128.59988
  #   -1.0     -106.23882
  #   -0.5      -90.84800
  #    0.0      -85.10204
  #    0.5      -88.69825
  #    1.0      -99.42630
  #    1.5     -115.23701
  #    2.0     -134.54125

  boxcox(x, objective.name = "Log-Likelihood", optimize = TRUE) 
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  Log-Likelihood
  #
  #Data:                            x
  #
  #Sample Size:                     30
  #
  #Bounds for Optimization:         lower = -2
  #                                 upper =  2
  #
  #Optimal Value:                   lambda = 0.0405156
  #
  #Value of Objective:              Log-Likelihood = -85.07123

  #----------

  # Plot the results based on the PPCC objective
  #---------------------------------------------
  boxcox.list <- boxcox(x)
  dev.new()
  plot(boxcox.list)

  #Look at QQ-Plots for the candidate values of lambda
  #---------------------------------------------------
  plot(boxcox.list, plot.type = "Q-Q Plots", same.window = FALSE) 

  #==========

  # The data frame Environmental.df contains daily measurements of 
  # ozone concentration, wind speed, temperature, and solar radiation
  # in New York City for 153 consecutive days between May 1 and 
  # September 30, 1973.  In this example, we'll plot ozone vs. 
  # temperature and look at the Q-Q plot of the residuals.  Then 
  # we'll look at possible Box-Cox transformations.  The "optimal" one 
  # based on the PPCC looks close to a log-transformation 
  # (i.e., lambda=0).  The power that produces the largest PPCC is 
  # about 0.2, so a cube root (lambda=1/3) transformation might work too.

  head(Environmental.df)
  #           ozone radiation temperature wind
  #05/01/1973    41       190          67  7.4
  #05/02/1973    36       118          72  8.0
  #05/03/1973    12       149          74 12.6
  #05/04/1973    18       313          62 11.5
  #05/05/1973    NA        NA          56 14.3
  #05/06/1973    28        NA          66 14.9

  tail(Environmental.df)
  #           ozone radiation temperature wind
  #09/25/1973    14        20          63 16.6
  #09/26/1973    30       193          70  6.9
  #09/27/1973    NA       145          77 13.2
  #09/28/1973    14       191          75 14.3
  #09/29/1973    18       131          76  8.0
  #09/30/1973    20       223          68 11.5


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

  # Plot PPCC vs. lambda based on Q-Q plots of residuals 
  #-----------------------------------------------------
  dev.new()
  plot(boxcox.list) 

  # Look at Q-Q plots of residuals for the various transformation 
  #--------------------------------------------------------------
  plot(boxcox.list, plot.type = "Q-Q Plots", same.window = FALSE)

  # Compute the "optimal" transformation
  #-------------------------------------
  boxcox(ozone.fit, optimize = TRUE)
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Linear Model:                    ozone.fit
  #
  #Sample Size:                     116
  #
  #Bounds for Optimization:         lower = -2
  #                                 upper =  2
  #
  #Optimal Value:                   lambda = 0.2004305
  #
  #Value of Objective:              PPCC = 0.9940222

  #==========

  # Clean up
  #---------
  rm(x, boxcox.list, ozone.fit)
  graphics.off()



