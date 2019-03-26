library(EnvStats)


### Name: enormCensored
### Title: Estimate Parameters for a Normal Distribution Based on Type I
###   Censored Data
### Aliases: enormCensored
### Keywords: distribution htest

### ** Examples

  # Chapter 15 of USEPA (2009) gives several examples of estimating the mean
  # and standard deviation of a lognormal distribution on the log-scale using 
  # manganese concentrations (ppb) in groundwater at five background wells. 
  # In EnvStats these data are stored in the data frame 
  # EPA.09.Ex.15.1.manganese.df.

  # Here we will estimate the mean and standard deviation using the MLE, 
  # Q-Q regression (also called parametric regression on order statistics 
  # or ROS; e.g., USEPA, 2009 and Helsel, 2012), and imputation with Q-Q 
  # regression (also called robust regression on order statistics or rROS). 

  # We will log-transform the original observations and then call 
  # enormCensored.  Alternatively, we could have more simply called 
  # elnormCensored.

  # First look at the data:
  #-----------------------

  EPA.09.Ex.15.1.manganese.df

  #   Sample   Well Manganese.Orig.ppb Manganese.ppb Censored
  #1       1 Well.1                 <5           5.0     TRUE
  #2       2 Well.1               12.1          12.1    FALSE
  #3       3 Well.1               16.9          16.9    FALSE
  #...
  #23      3 Well.5                3.3           3.3    FALSE
  #24      4 Well.5                8.4           8.4    FALSE
  #25      5 Well.5                 <2           2.0     TRUE

  longToWide(EPA.09.Ex.15.1.manganese.df, 
    "Manganese.Orig.ppb", "Sample", "Well",
    paste.row.name = TRUE)  

  #         Well.1 Well.2 Well.3 Well.4 Well.5
  #Sample.1     <5     <5     <5    6.3   17.9
  #Sample.2   12.1    7.7    5.3   11.9   22.7
  #Sample.3   16.9   53.6   12.6     10    3.3
  #Sample.4   21.6    9.5  106.3     <2    8.4
  #Sample.5     <2   45.9   34.5   77.2     <2


  # Now estimate the mean and standard deviation on the log-scale 
  # using the MLE:
  #---------------------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    enormCensored(log(Manganese.ppb), Censored))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              0.6931472 1.6094379 
  #
  #Estimated Parameter(s):          mean = 2.215905
  #                                 sd   = 1.356291
  #
  #Estimation Method:               MLE
  #
  #Data:                            log(Manganese.ppb)
  #
  #Censoring Variable:              Censored
  #
  #Sample Size:                     25
  #
  #Percent Censored:                24%

  # Now compare the MLE with the estimators based on 
  # Q-Q regression and imputation with Q-Q regression
  #--------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    enormCensored(log(Manganese.ppb), Censored))$parameters
  #    mean       sd 
  #2.215905 1.356291

  with(EPA.09.Ex.15.1.manganese.df,
    enormCensored(log(Manganese.ppb), Censored, 
    method = "ROS"))$parameters
  #    mean       sd 
  #2.293742 1.283635

  with(EPA.09.Ex.15.1.manganese.df,
    enormCensored(log(Manganese.ppb), Censored, 
    method = "rROS"))$parameters
  #    mean       sd 
  #2.298656 1.238104

  #----------

  # The method used to estimate quantiles for a Q-Q plot is 
  # determined by the argument prob.method.  For the functions
  # enormCensored and elnormCensored, for any estimation 
  # method that involves Q-Q regression, the default value of 
  # prob.method is "hirsch-stedinger" and the default value for the 
  # plotting position constant is plot.pos.con=0.375.  

  # Both Helsel (2012) and USEPA (2009) also use the Hirsch-Stedinger 
  # probability method but set the plotting position constant to 0. 

  with(EPA.09.Ex.15.1.manganese.df,
    enormCensored(log(Manganese.ppb), Censored,
    method = "rROS", plot.pos.con = 0))$parameters
  #    mean       sd 
  #2.277175 1.261431

  #----------

  # Using the same data as above, compute a confidence interval 
  # for the mean on the log-scale using the profile-likelihood
  # method.

  with(EPA.09.Ex.15.1.manganese.df,
    enormCensored(log(Manganese.ppb), Censored, ci = TRUE))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              0.6931472 1.6094379 
  #
  #Estimated Parameter(s):          mean = 2.215905
  #                                 sd   = 1.356291
  #
  #Estimation Method:               MLE
  #
  #Data:                            log(Manganese.ppb)
  #
  #Censoring Variable:              Censored
  #
  #Sample Size:                     25
  #
  #Percent Censored:                24%
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Profile Likelihood
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 1.595062
  #                                 UCL = 2.771197



