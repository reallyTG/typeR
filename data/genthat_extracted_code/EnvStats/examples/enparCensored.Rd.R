library(EnvStats)


### Name: enparCensored
### Title: Estimate Mean, Standard Deviation, and Standard Error
###   Nonparametrically Based on Censored Data
### Aliases: enparCensored
### Keywords: distribution htest

### ** Examples

  # Example 15-1 of USEPA (2009, page 15-10) gives an example of
  # estimating the mean and standard deviation nonparametrically 
  # using the Kaplan-Meier estimators based on censored manganese 
  # concentrations (ppb) in groundwater collected at 5 monitoring
  # wells.  The data for this example are stored in 
  # EPA.09.Ex.15.1.manganese.df.

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

  #----------

  # Following Example 15-1 in USEPA (2009, p.15-10), 
  # estimate the log-scale mean and standard deviation 
  # nonparametrically using the Kaplan-Meier method
  #------------------------------------------------
  with(EPA.09.Ex.15.1.manganese.df, 
    enparCensored(log(Manganese.ppb), Censored, ci = TRUE))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              0.6931472 1.6094379 
  #
  #Estimated Parameter(s):          mean    = 2.3092890
  #                                 sd      = 1.1816102
  #                                 se.mean = 0.1682862
  #
  #Estimation Method:               Kaplan-Meier
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
  #Confidence Interval Method:      Normal Approximation
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 1.979454
  #                                 UCL = 2.639124

  #----------

  # Now estimate the mean and standard deviation on the 
  # original scale nonparametrically using the 
  # Kaplan-Meier method.
  #-----------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df, 
    enparCensored(Manganese.ppb, Censored, ci = TRUE))

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 5 
  #
  #Estimated Parameter(s):          mean    = 19.867000
  #                                 sd      = 25.317737
  #                                 se.mean =  4.689888
  #
  #Estimation Method:               Kaplan-Meier
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
  #Confidence Interval Method:      Normal Approximation
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 10.67499
  #                                 UCL = 29.05901



