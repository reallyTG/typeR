library(EnvStats)


### Name: plot.boxcoxCensored
### Title: Plot Results of Box-Cox Transformations Based on Type I Censored
###   Data
### Aliases: plot.boxcoxCensored
### Keywords: plot

### ** Examples

  # Generate 15 observations from a lognormal distribution with 
  # mean=10 and cv=2 and censor the observations less than 2.  
  # Then generate 15 more observations from this distribution and 
  # censor the observations less than 4.  
  # Then call the function boxcoxCensored, and then plot the results.  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 

  x.1 <- rlnormAlt(15, mean = 10, cv = 2) 
  censored.1 <- x.1 < 2
  x.1[censored.1] <- 2

  x.2 <- rlnormAlt(15, mean = 10, cv = 2) 
  censored.2 <- x.2 < 4
  x.2[censored.2] <- 4

  x <- c(x.1, x.2)
  censored <- c(censored.1, censored.2)

  # Plot the results based on the PPCC objective
  #---------------------------------------------
  boxcox.list <- boxcoxCensored(x, censored)
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
  rm(x.1, censored.1, x.2, censored.2, x, censored, boxcox.list)
  graphics.off()



