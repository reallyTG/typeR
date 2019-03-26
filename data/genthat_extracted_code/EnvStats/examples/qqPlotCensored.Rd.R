library(EnvStats)


### Name: qqPlotCensored
### Title: Quantile-Quantile (Q-Q) Plot for Type I Censored Data
### Aliases: qqPlotCensored
### Keywords: distribution hplot

### ** Examples

  # Generate 20 observations from a normal distribution with mean=20 and sd=5, 
  # censor all observations less than 18, then generate a Q-Q plot assuming 
  # a normal distribution for the complete data set and the censored data set.  
  # Note that the Q-Q plot for the censored data set starts at the first ordered 
  # uncensored observation, and that for values of x > 18 the two Q-Q plots are 
  # exactly the same.  This is because there is only one censoring level and 
  # no uncensored observations fall below the censored observations. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(333) 
  x <- rnorm(20, mean=20, sd=5) 
  censored <- x < 18

  sum(censored) 
  #[1] 7 

  new.x <- x 
  new.x[censored] <- 18

  dev.new()
  qqPlot(x, ylim = range(pretty(x)), 
    main = "Q-Q Plot for\nComplete Data Set") 

  dev.new()
  qqPlotCensored(new.x, censored, ylim = range(pretty(x)), 
    main="Q-Q Plot for\nCensored Data Set")

  # Clean up
  #---------
  rm(x, censored, new.x)

  #------------------------------------------------------------------------------------

  # Example 15-1 of USEPA (2009, page 15-10) gives an example of
  # computing plotting positions based on censored manganese 
  # concentrations (ppb) in groundwater collected at 5 monitoring
  # wells.  The data for this example are stored in 
  # EPA.09.Ex.15.1.manganese.df.  Here we will create a Q-Q
  # plot based on the Kaplan-Meier method.  First we'll assume 
  # a normal distribution, then a lognormal distribution, then a 
  # gamma distribution.

  EPA.09.Ex.15.1.manganese.df
  #   Sample   Well Manganese.Orig.ppb Manganese.ppb Censored
  #1       1 Well.1                 <5           5.0     TRUE
  #2       2 Well.1               12.1          12.1    FALSE
  #3       3 Well.1               16.9          16.9    FALSE
  #4       4 Well.1               21.6          21.6    FALSE
  #5       5 Well.1                 <2           2.0     TRUE
  #...
  #21      1 Well.5               17.9          17.9    FALSE
  #22      2 Well.5               22.7          22.7    FALSE
  #23      3 Well.5                3.3           3.3    FALSE
  #24      4 Well.5                8.4           8.4    FALSE
  #25      5 Well.5                 <2           2.0     TRUE

  # Assume normal distribution
  #---------------------------

  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    qqPlotCensored(Manganese.ppb, Censored, 
      prob.method = "kaplan-meier", points.col = "blue", add.line = TRUE,
      main = paste("Normal Q-Q Plot of Manganese Data", 
          "Based on Kaplan-Meier Plotting Positions", sep = "\n")))

  # Include max value in the plot
  #------------------------------

  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    qqPlotCensored(Manganese.ppb, Censored, 
      prob.method = "modified kaplan-meier", points.col = "blue", 
      add.line = TRUE,
      main = paste("Normal Q-Q Plot of Manganese Data", 
          "Based on Kaplan-Meier Plotting Positions",
          "(Max Included)", sep = "\n")))
  

  # Assume lognormal distribution
  #------------------------------

  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    qqPlotCensored(Manganese.ppb, Censored, dist = "lnorm", 
      prob.method = "kaplan-meier", points.col = "blue", add.line = TRUE,
      main = paste("Lognormal Q-Q Plot of Manganese Data", 
          "Based on Kaplan-Meier Plotting Positions", sep = "\n")))

  # Include max value in the plot
  #------------------------------

  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    qqPlotCensored(Manganese.ppb, Censored, dist = "lnorm", 
      prob.method = "modified kaplan-meier", points.col = "blue", 
      add.line = TRUE,
      main = paste("Lognormal Q-Q Plot of Manganese Data", 
          "Based on Kaplan-Meier Plotting Positions",
          "(Max Included)", sep = "\n")))


  # The lognormal distribution appears to be a better fit.
  # Now create a Q-Q plot assuming a gamma distribution.  Here we'll 
  # need to set estimate.params=TRUE.

  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    qqPlotCensored(Manganese.ppb, Censored, dist = "gamma", 
      estimate.params = TRUE, prob.method = "kaplan-meier", 
      points.col = "blue", add.line = TRUE,
      main = paste("Gamma Q-Q Plot of Manganese Data", 
          "Based on Kaplan-Meier Plotting Positions", sep = "\n")))

  # Include max value in the plot
  #------------------------------

  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    qqPlotCensored(Manganese.ppb, Censored, dist = "gamma", 
      estimate.params = TRUE, prob.method = "modified kaplan-meier", 
      points.col = "blue", add.line = TRUE,
      main = paste("Gamma Q-Q Plot of Manganese Data", 
          "Based on Kaplan-Meier Plotting Positions",
          "(Max Included)", sep = "\n")))

  #==========

  # Clean up
  #---------
  graphics.off()



