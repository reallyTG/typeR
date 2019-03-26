library(EnvStats)


### Name: elnormAltCensored
### Title: Estimate Parameters for a Lognormal Distribution (Original
###   Scale) Based on Type I Censored Data
### Aliases: elnormAltCensored
### Keywords: distribution htest

### ** Examples

  # Chapter 15 of USEPA (2009) gives several examples of estimating the mean
  # and standard deviation of a lognormal distribution on the log-scale using 
  # manganese concentrations (ppb) in groundwater at five background wells. 
  # In EnvStats these data are stored in the data frame 
  # EPA.09.Ex.15.1.manganese.df.

  # Here we will estimate the mean and coefficient of variation 
  # ON THE ORIGINAL SCALE using the MLE, QMVUE, 
  # and robust ROS (imputation with Q-Q regression). 

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


  # Now estimate the mean and coefficient of variation 
  # using the MLE:
  #---------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 5 
  #
  #Estimated Parameter(s):          mean = 23.003987
  #                                 cv   =  2.300772
  #
  #Estimation Method:               MLE
  #
  #Data:                            Manganese.ppb
  #
  #Censoring Variable:              Censored
  #
  #Sample Size:                     25
  #
  #Percent Censored:                24%

  # Now compare the MLE with the QMVUE and the 
  # estimator based on robust ROS
  #-------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored))$parameters
  #     mean        cv 
  #23.003987  2.300772

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored, 
    method = "qmvue"))$parameters
  #     mean        cv 
  #21.566945  1.841366 

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored, 
    method = "rROS"))$parameters
  #     mean        cv 
  #19.886180  1.298868

  #----------

  # The method used to estimate quantiles for a Q-Q plot is 
  # determined by the argument prob.method.  For the function
  # elnormCensoredAlt, for any estimation method that involves 
  # Q-Q regression, the default value of prob.method is 
  # "hirsch-stedinger" and the default value for the 
  # plotting position constant is plot.pos.con=0.375.  

  # Both Helsel (2012) and USEPA (2009) also use the Hirsch-Stedinger 
  # probability method but set the plotting position constant to 0. 

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored,
    method = "rROS", plot.pos.con = 0))$parameters
  #     mean        cv 
  #19.827673  1.304725

  #----------

  # Using the same data as above, compute a confidence interval 
  # for the mean using the profile-likelihood method.

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored, ci = TRUE))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 5 
  #
  #Estimated Parameter(s):          mean = 23.003987
  #                                 cv   =  2.300772
  #
  #Estimation Method:               MLE
  #
  #Data:                            Manganese.ppb
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
  #Confidence Interval:             LCL = 12.37629
  #                                 UCL = 69.87694



