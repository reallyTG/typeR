library(EnvStats)


### Name: qqPlot
### Title: Quantile-Quantile (Q-Q) Plot
### Aliases: qqPlot
### Keywords: distribution hplot

### ** Examples

  # The guidance document USEPA (1994b, pp. 6.22--6.25) 
  # contains measures of 1,2,3,4-Tetrachlorobenzene (TcCB) 
  # concentrations (in parts per billion) from soil samples 
  # at a Reference area and a Cleanup area.  These data are strored 
  # in the data frame EPA.94b.tccb.df.  
  #
  # Create an Q-Q plot for the reference area data first assuming a 
  # normal distribution, then a lognormal distribution, then a 
  # gamma distribution.
  
  # Assume a normal distribution
  #-----------------------------

  dev.new()
  with(EPA.94b.tccb.df, qqPlot(TcCB[Area == "Reference"]))

  dev.new()
  with(EPA.94b.tccb.df, qqPlot(TcCB[Area == "Reference"], add.line = TRUE))

  dev.new()
  with(EPA.94b.tccb.df, qqPlot(TcCB[Area == "Reference"], 
    plot.type = "Tukey", add.line = TRUE))


  # The Q-Q plot based on assuming a normal distribution shows a U-shape,
  # indicating the Reference area TcCB data are skewed to the right
  # compared to a normal distribuiton.

  # Assume a lognormal distribution
  #--------------------------------

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "lnorm", 
      digits = 2, points.col = "blue", add.line = TRUE))

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "lnorm", 
      digits = 2, plot.type = "Tukey", points.col = "blue", 
      add.line = TRUE))

  # Alternative parameterization

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "lnormAlt", 
      estimate.params = TRUE, digits = 2, points.col = "blue", 
      add.line = TRUE))

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "lnormAlt", 
      digits = 2, plot.type = "Tukey", points.col = "blue", 
      add.line = TRUE))


  # The lognormal distribution appears to be an adequate fit.
  # Now look at a Q-Q plot assuming a gamma distribution.
  #----------------------------------------------------------

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "gamma", 
      estimate.params = TRUE, digits = 2, points.col = "blue", 
      add.line = TRUE))

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "gamma", 
      digits = 2, plot.type = "Tukey", points.col = "blue", 
      add.line = TRUE))

  # Alternative Parameterization

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "gammaAlt", 
      estimate.params = TRUE, digits = 2, points.col = "blue", 
      add.line = TRUE))

  dev.new()
  with(EPA.94b.tccb.df, 
    qqPlot(TcCB[Area == "Reference"], dist = "gammaAlt", 
      digits = 2, plot.type = "Tukey", points.col = "blue", 
      add.line = TRUE))

  #-------------------------------------------------------------------------------------

  # Generate 20 observations from a gamma distribution with parameters 
  # shape=2 and scale=2, then create a normal (Gaussian) Q-Q plot for these data. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(357) 
  dat <- rgamma(20, shape=2, scale=2) 
  dev.new()
  qqPlot(dat, add.line = TRUE)

  # Now assume a gamma distribution and estimate the parameters
  #------------------------------------------------------------

  dev.new()
  qqPlot(dat, dist = "gamma", estimate.params = TRUE, add.line = TRUE)

  # Clean up
  #---------
  rm(dat)
  graphics.off()



