library(EnvStats)


### Name: boxcoxCensored
### Title: Boxcox Power Transformation for Type I Censored Data
### Aliases: boxcoxCensored 'Box-Cox Censored' 'BoxCox Censored' 'Box-Cox
###   Transformation for Censored Data' 'BoxCox Transformation for Censored
###   Data'
### Keywords: univar models

### ** Examples

  # Generate 15 observations from a lognormal distribution with 
  # mean=10 and cv=2 and censor the observations less than 2.  
  # Then generate 15 more observations from this distribution and 
  # censor the observations less than 4.  
  # Then Look at some values of various objectives for various transformations.  
  # Note that for both the PPCC objective the optimal value is about -0.3, 
  # whereas for the Log-Likelihood objective it is about 0.3.
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

  #--------------------------
  # Using the PPCC objective:
  #--------------------------

  boxcoxCensored(x, censored) 

  #Results of Box-Cox Transformation
  #Based on Type I Censored Data
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 4 
  #
  #Sample Size:                     30
  #
  #Percent Censored:                26.7%
  #
  # lambda      PPCC
  #   -2.0 0.8954683
  #   -1.5 0.9338467
  #   -1.0 0.9643680
  #   -0.5 0.9812969
  #    0.0 0.9776834
  #    0.5 0.9471025
  #    1.0 0.8901990
  #    1.5 0.8187488
  #    2.0 0.7480494


  boxcoxCensored(x, censored, optimize = TRUE)

  #Results of Box-Cox Transformation
  #Based on Type I Censored Data
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 4 
  #
  #Sample Size:                     30
  #
  #Percent Censored:                26.7%
  #
  #Bounds for Optimization:         lower = -2
  #                                 upper =  2
  #
  #Optimal Value:                   lambda = -0.3194799
  #
  #Value of Objective:              PPCC = 0.9827546


  #-----------------------------------
  # Using the Log-Likelihodd objective
  #-----------------------------------

  boxcoxCensored(x, censored, objective.name = "Log-Likelihood") 

  #Results of Box-Cox Transformation
  #Based on Type I Censored Data
  #---------------------------------
  #
  #Objective Name:                  Log-Likelihood
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 4 
  #
  #Sample Size:                     30
  #
  #Percent Censored:                26.7%
  #
  # lambda Log-Likelihood
  #   -2.0      -95.38785
  #   -1.5      -84.76697
  #   -1.0      -75.36204
  #   -0.5      -68.12058
  #    0.0      -63.98902
  #    0.5      -63.56701
  #    1.0      -66.92599
  #    1.5      -73.61638
  #    2.0      -82.87970


  boxcoxCensored(x, censored, objective.name = "Log-Likelihood", 
    optimize = TRUE) 

  #Results of Box-Cox Transformation
  #Based on Type I Censored Data
  #---------------------------------
  #
  #Objective Name:                  Log-Likelihood
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 4 
  #
  #Sample Size:                     30
  #
  #Percent Censored:                26.7%
  #
  #Bounds for Optimization:         lower = -2
  #                                 upper =  2
  #
  #Optimal Value:                   lambda = 0.3049744
  #
  #Value of Objective:              Log-Likelihood = -63.2733

  #----------

  # Plot the results based on the PPCC objective
  #---------------------------------------------
  boxcox.list <- boxcoxCensored(x, censored)
  dev.new()
  plot(boxcox.list)

  #Look at QQ-Plots for the candidate values of lambda
  #---------------------------------------------------
  plot(boxcox.list, plot.type = "Q-Q Plots", same.window = FALSE) 

  #==========

  # Clean up
  #---------
  rm(x.1, censored.1, x.2, censored.2, x, censored, boxcox.list)
  graphics.off()



