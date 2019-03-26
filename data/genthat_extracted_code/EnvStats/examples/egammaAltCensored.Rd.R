library(EnvStats)


### Name: egammaAltCensored
### Title: Estimate Mean and Coefficient of Variation for a Gamma
###   Distribution Based on Type I Censored Data
### Aliases: egammaAltCensored
### Keywords: distribution htest

### ** Examples

  # Chapter 15 of USEPA (2009) gives several examples of estimating the mean
  # and standard deviation of a lognormal distribution on the log-scale using 
  # manganese concentrations (ppb) in groundwater at five background wells. 
  # In EnvStats these data are stored in the data frame 
  # EPA.09.Ex.15.1.manganese.df.

  # Here we will estimate the mean and coefficient of variation 
  # ON THE ORIGINAL SCALE using the MLE and 
  # assuming a gamma distribution. 

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
  # using the MLE, and compute a confidence interval 
  # for the mean using the profile-likelihood method.
  #---------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    egammaAltCensored(Manganese.ppb, Censored, ci = TRUE))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 5 
  #
  #Estimated Parameter(s):          mean = 19.664797
  #                                 cv   =  1.252936
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
  #Confidence Interval:             LCL = 12.25151
  #                                 UCL = 34.35332

  #----------

  # Compare the confidence interval for the mean 
  # based on assuming a lognormal distribution versus 
  # assuming a gamma distribution.

  with(EPA.09.Ex.15.1.manganese.df,
    elnormAltCensored(Manganese.ppb, Censored, 
      ci = TRUE))$interval$limits
  #     LCL      UCL 
  #12.37629 69.87694

  with(EPA.09.Ex.15.1.manganese.df,
    egammaAltCensored(Manganese.ppb, Censored, 
      ci = TRUE))$interval$limits
  #     LCL      UCL 
  #12.25151 34.35332



