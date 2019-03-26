library(EnvStats)


### Name: plot.gofGroup
### Title: Plot Results of Group Goodness-of-Fit Test
### Aliases: plot.gofGroup
### Keywords: plot

### ** Examples

  # Create an object of class "gofGroup" then plot it.

  # Example 10-4 of USEPA (2009, page 10-20) gives an example of 
  # simultaneously testing the assumption of normality for nickel 
  # concentrations (ppb) in groundwater collected at 4 monitoring 
  # wells over 5 months.  The data for this example are stored in 
  # EPA.09.Ex.10.1.nickel.df.

  EPA.09.Ex.10.1.nickel.df
  #   Month   Well Nickel.ppb
  #1      1 Well.1       58.8
  #2      3 Well.1        1.0
  #3      6 Well.1      262.0
  #...
  #18     6 Well.4       85.6
  #19     8 Well.4       10.0
  #20    10 Well.4      637.0


  # Test for a normal distribution at each well:
  #--------------------------------------------

  gofGroup.obj <- gofGroupTest(Nickel.ppb ~ Well, 
    data = EPA.09.Ex.10.1.nickel.df)

  dev.new()
  plot(gofGroup.obj)

  # Make your own titles for the summary plot
  #------------------------------------------
  dev.new()
  plot(gofGroup.obj, captions = list(QQ = "Q-Q Plot", 
    ScoresQQ = "Scores Q-Q Plot", Results = "Results"),
    om.title = "Summary Plot")

  # Just the Q-Q Plot
  #------------------
  dev.new()
  plot(gofGroup.obj, plot.type="Q-Q")


  # Make your own title for the Q-Q Plot
  #-------------------------------------
  dev.new()
  plot(gofGroup.obj, plot.type="Q-Q", main = "Q-Q Plot")

  #==========

  # Clean up
  #---------
  rm(gofGroup.obj)
  graphics.off()



