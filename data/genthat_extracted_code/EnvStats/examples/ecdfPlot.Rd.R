library(EnvStats)


### Name: ecdfPlot
### Title: Empirical Cumulative Distribution Function Plot
### Aliases: ecdfPlot
### Keywords: distribution hplot

### ** Examples

  # Generate 20 observations from a normal distribution with 
  # mean=0 and sd=1 and create an ecdf plot. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rnorm(20) 
  dev.new()
  ecdfPlot(x)

  #----------

  # Repeat the above example, but fill in the area under the 
  # empirical cdf curve.

  dev.new()
  ecdfPlot(x, curve.fill = TRUE)

  #----------

  # Repeat the above example, but plot only the points.

  dev.new()
  ecdfPlot(x, type = "p")

  #----------

  # Repeat the above example, but force a step function.

  dev.new()
  ecdfPlot(x, type = "s")

  #----------

  # Clean up
  rm(x)

  #-------------------------------------------------------------------------------------

  # The guidance document USEPA (1994b, pp. 6.22--6.25) 
  # contains measures of 1,2,3,4-Tetrachlorobenzene (TcCB) 
  # concentrations (in parts per billion) from soil samples 
  # at a Reference area and a Cleanup area.  These data are strored 
  # in the data frame EPA.94b.tccb.df.  
  #
  # Create an empirical CDF plot for the reference area data.
  
  dev.new()
  with(EPA.94b.tccb.df, 
    ecdfPlot(TcCB[Area == "Reference"], xlab = "TcCB (ppb)"))

  #==========

  # Clean up
  #---------
  graphics.off()



