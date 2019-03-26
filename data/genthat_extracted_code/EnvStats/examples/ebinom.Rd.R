library(EnvStats)


### Name: ebinom
### Title: Estimate Parameter of a Binomial Distribution
### Aliases: ebinom
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a binomial distribution with 
  # parameters size=1 and prob=0.2, then estimate the 'prob' parameter. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example. Also, the only parameter estimated is 'prob'; 'size' is
  # specified in the call to ebinom.  The parameter 'size' is printed
  # inorder to show all of the parameters associated with the 
  # distribution.)

  set.seed(251) 
  dat <- rbinom(20, size = 1, prob = 0.2) 
  ebinom(dat) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Binomial
  #
  #Estimated Parameter(s):          size = 20.0
  #                                 prob =  0.1
  #
  #Estimation Method:               mle/mme/mvue for 'prob'
  #
  #Data:                            dat
  #
  #Sample Size:                     20

  #----------------------------------------------------------------

  # Generate one observation from a binomial distribution with 
  # parameters size=20 and prob=0.2, then estimate the "prob" 
  # parameter and compute a confidence interval:

  set.seed(763) 
  dat <- rbinom(1, size=20, prob=0.2) 
  ebinom(dat, size = 20, ci = TRUE) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Binomial
  #
  #Estimated Parameter(s):          size = 20.00
  #                                 prob =  0.35
  #
  #Estimation Method:               mle/mme/mvue for 'prob'
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         prob
  #
  #Confidence Interval Method:      Score normal approximation
  #                                 (With continuity correction)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.1630867
  #                                 UCL = 0.5905104

  #----------------------------------------------------------------

  # Using the data from the last example, compare confidence 
  # intervals based on the various methods

  ebinom(dat, size = 20, ci = TRUE, 
    ci.method = "score", correct = TRUE)$interval$limits
  #      LCL       UCL 
  #0.1630867 0.5905104


  ebinom(dat, size = 20, ci = TRUE, 
    ci.method = "score", correct = FALSE)$interval$limits
  #      LCL       UCL 
  #0.1811918 0.5671457 


  ebinom(dat, size = 20, ci = TRUE, 
    ci.method = "exact")$interval$limits
  #      LCL       UCL 
  #0.1539092 0.5921885 

  ebinom(dat, size = 20, ci = TRUE, 
    ci.method = "adjusted Wald")$interval$limits
  #      LCL       UCL 
  #0.1799264 0.5684112 


  ebinom(dat, size = 20, ci = TRUE, 
    ci.method = "Wald", correct = TRUE)$interval$limits
  #      LCL       UCL 
  #0.1159627 0.5840373 


  ebinom(dat, size = 20, ci = TRUE, 
    ci.method = "Wald", correct = FALSE)$interval$limits
  #      LCL       UCL 
  #0.1409627 0.5590373 


  #----------------------------------------------------------------

  # Use the cadmium data on page 8-6 of USEPA (1989b) to compute 
  # two-sided 95% confidence intervals for the probability of 
  # detection at background and compliance wells.  The data are 
  # stored in EPA.89b.cadmium.df.

  EPA.89b.cadmium.df
  #   Cadmium.orig Cadmium Censored  Well.type
  #1           0.1   0.100    FALSE Background
  #2          0.12   0.120    FALSE Background
  #3           BDL   0.000     TRUE Background
  #...
  #86          BDL   0.000     TRUE Compliance
  #87          BDL   0.000     TRUE Compliance
  #88          BDL   0.000     TRUE Compliance

  attach(EPA.89b.cadmium.df)

  # Probability of detection at Background well:
  #--------------------------------------------

  ebinom(!Censored[Well.type=="Background"], ci=TRUE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Binomial
  #
  #Estimated Parameter(s):          size = 24.0000000
  #                                 prob =  0.3333333
  #
  #Estimation Method:               mle/mme/mvue for 'prob'
  #
  #Data:                            !Censored[Well.type == "Background"]
  #
  #Sample Size:                     24
  #
  #Confidence Interval for:         prob
  #
  #Confidence Interval Method:      Score normal approximation
  #                                 (With continuity correction)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.1642654
  #                                 UCL = 0.5530745


  # Probability of detection at Compliance well:
  #--------------------------------------------

  ebinom(!Censored[Well.type=="Compliance"], ci=TRUE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Binomial
  #
  #Estimated Parameter(s):          size = 64.000
  #                                 prob =  0.375
  #
  #Estimation Method:               mle/mme/mvue for 'prob'
  #
  #Data:                            !Censored[Well.type == "Compliance"]
  #
  #Sample Size:                     64
  #
  #Confidence Interval for:         prob
  #
  #Confidence Interval Method:      Score normal approximation
  #                                 (With continuity correction)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.2597567
  #                                 UCL = 0.5053034

  #----------------------------------------------------------------

  # Clean up
  rm(dat)
  detach("EPA.89b.cadmium.df")



