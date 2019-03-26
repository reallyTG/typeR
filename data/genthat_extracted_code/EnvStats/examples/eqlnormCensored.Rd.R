library(EnvStats)


### Name: eqlnormCensored
### Title: Estimate Quantiles of a Lognormal Distribution Based on Type I
###   Censored Data
### Aliases: eqlnormCensored
### Keywords: distribution htest

### ** Examples

  # Generate 15 observations from a lognormal distribution with 
  # parameters meanlog=3 and sdlog=0.5, and censor observations less than 10. 
  # Then generate 15 more observations from this distribution and  censor 
  # observations less than 9.
  # Then estimate the 90th percentile and create a one-sided upper 95% 
  # confidence interval for that percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(47) 

  x.1 <- rlnorm(15, meanlog = 3, sdlog = 0.5) 
  sort(x.1)
  # [1]  8.051717  9.651611 11.671282 12.271247 12.664108 17.446124
  # [7] 17.707301 20.238069 20.487219 21.025510 21.208197 22.036554
  #[13] 25.710773 28.661973 54.453557

  censored.1 <- x.1 < 10
  x.1[censored.1] <- 10

  x.2 <- rlnorm(15, meanlog = 3, sdlog = 0.5) 
  sort(x.2)
  # [1]  6.289074  7.511164  8.988267  9.179006 12.869408 14.130081
  # [7] 16.941937 17.060513 19.287572 19.682126 20.363893 22.750203
  #[13] 24.744306 28.089325 37.792873

  censored.2 <- x.2 < 9
  x.2[censored.2] <- 9

  x <- c(x.1, x.2)
  censored <- c(censored.1, censored.2)

  eqlnormCensored(x, censored, p = 0.9, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):               9 10 
  #
  #Estimated Parameter(s):          meanlog = 2.8099300
  #                                 sdlog   = 0.5137151
  #
  #Estimation Method:               MLE
  #
  #Estimated Quantile(s):           90'th %ile = 32.08159
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 MLE Estimators
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #  
  #Sample Size:                     30
  #
  #Percent Censored:                16.66667%
  #
  #Confidence Interval for:         90'th %ile
  #
  #Assumed Sample Size:             30
  #
  #Confidence Interval Method:      Exact for
  #                                 Complete Data
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  0.00000
  #                                 UCL = 41.38716

  #----------

  # Compare these results with the true 90'th percentile:

  qlnorm(p = 0.9, meanlog = 3, sd = 0.5)
  #[1] 38.1214

  #----------

  # Clean up
  rm(x.1, censored.1, x.2, censored.2, x, censored)
  
  #--------------------------------------------------------------------

  # Chapter 15 of USEPA (2009) gives several examples of estimating the mean
  # and standard deviation of a lognormal distribution on the log-scale using 
  # manganese concentrations (ppb) in groundwater at five background wells. 
  # In EnvStats these data are stored in the data frame 
  # EPA.09.Ex.15.1.manganese.df.

  # Here we will estimate the mean and standard deviation using the MLE, 
  # and then construct an upper 95% confidence limit for the 90th percentile. 

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


  # Now estimate the mean, standard deviation, and 90th percentile 
  # on the log-scale using the MLE, and construct an upper 95% 
  # confidence limit for the 90th percentile:
  #---------------------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    eqlnormCensored(Manganese.ppb, Censored, 
      p = 0.9, ci = TRUE, ci.type = "upper"))

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
  #Estimated Parameter(s):          meanlog = 2.215905
  #                                 sdlog   = 1.356291
  #
  #Estimation Method:               MLE
  #
  #Estimated Quantile(s):           90'th %ile = 52.14674
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 MLE Estimators
  #
  #Data:                            Manganese.ppb
  #
  #Censoring Variable:              censored
  #
  #Sample Size:                     25
  #
  #Percent Censored:                24%
  #
  #Confidence Interval for:         90'th %ile
  #
  #Assumed Sample Size:             25
  #
  #Confidence Interval Method:      Exact for
  #                                 Complete Data
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =   0.0000
  #                                 UCL = 110.9305



