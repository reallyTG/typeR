library(EnvStats)


### Name: distChooseCensored
### Title: Choose Best Fitting Distribution Based on Goodness-of-Fit Tests
###   for Censored Data
### Aliases: distChooseCensored
### Keywords: htest models

### ** Examples

  # Generate 30 observations from a gamma distribution with 
  # parameters mean=10 and cv=1 and then censor observations less than 5. 
  # Then:
  #
  # 1) Call distChooseCensored using the Shapiro-Wilk method and specify 
  #    choices of the 
  #      normal, 
  #      gamma (alternative parameterzation), and 
  #      lognormal (alternative parameterization) 
  #    distributions.
  #
  # 2) Compare the results in 1) above with the results using the
  #    ProUCL method. 
  #
  # Notes:  The call to set.seed lets you reproduce this example.
  #
  #         The ProUCL method chooses the Normal distribution, whereas the 
  #         Shapiro-Wilk method chooses the Gamma distribution.

  set.seed(598)

  dat <- sort(rgammaAlt(30, mean = 10, cv = 1))
  dat
  # [1]  0.5313509  1.4741833  1.9936208  2.7980636  3.4509840
  # [6]  3.7987348  4.5542952  5.5207531  5.5253596  5.7177872
  #[11]  5.7513827  9.1086375  9.8444090 10.6247123 10.9304922
  #[16] 11.7925398 13.3432689 13.9562777 14.6029065 15.0563342
  #[21] 15.8730642 16.0039936 16.6910715 17.0288922 17.8507891
  #[26] 19.1105522 20.2657141 26.3815970 30.2912797 42.8726101

  dat.censored <- dat
  censored <- dat.censored < 5
  dat.censored[censored] <- 5


  # 1) Call distChooseCensored using the Shapiro-Wilk method.
  #----------------------------------------------------------

  distChooseCensored(dat.censored, censored, method = "sw", 
    choices = c("norm", "gammaAlt", "lnormAlt"))

  #Results of Choosing Distribution
  #--------------------------------
  #
  #Candidate Distributions:         Normal
  #                                 Gamma
  #                                 Lognormal
  #
  #Choice Method:                   Shapiro-Wilk
  #
  #Type I Error per Test:           0.05
  #
  #Decision:                        Gamma
  #
  #Estimated Parameter(s):          mean = 12.4911448
  #                                 cv   =  0.7617343
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat.censored
  #
  #Sample Size:                     30
  #
  #Censoring Side:                  left
  #
  #Censoring Variable:              censored
  #
  #Censoring Level(s):              5 
  #
  #Percent Censored:                23.33333%
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              W = 0.9372741
  #    P-value:                     0.1704876
  #
  #  Gamma                          
  #    Test Statistic:              W = 0.9613711
  #    P-value:                     0.522329
  #
  #  Lognormal                      
  #    Test Statistic:              W = 0.9292406
  #    P-value:                     0.114511

  #--------------------

  # 2) Compare the results in 1) above with the results using the
  #    ProUCL method. 
  #---------------------------------------------------------------

  distChooseCensored(dat.censored, censored, method = "proucl")

  #Results of Choosing Distribution
  #--------------------------------
  #
  #Candidate Distributions:         Normal
  #                                 Gamma
  #                                 Lognormal
  #
  #Choice Method:                   ProUCL
  #
  #Type I Error per Test:           0.05
  #
  #Decision:                        Normal
  #
  #Estimated Parameter(s):          mean = 15.397584
  #                                 sd   =  8.688302
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat.censored
  #
  #Sample Size:                     30
  #
  #Censoring Side:                  left
  #
  #Censoring Variable:              censored
  #
  #Censoring Level(s):              5 
  #
  #Percent Censored:                23.33333%
  #
  #ProUCL Sample Size:              23
  #
  #Test Results:
  #
  #  Normal                         
  #    Shapiro-Wilk GOF                       
  #      Test Statistic:            W = 0.861652
  #      P-value:                   0.004457924
  #    Lilliefors (Kolmogorov-Smirnov) GOF                       
  #      Test Statistic:            D = 0.1714435
  #      P-value:                   0.07794315
  #
  #  Gamma                          
  #    ProUCL Anderson-Darling Gamma GOF                        
  #      Test Statistic:            A = 0.3805556
  #      P-value:                   >= 0.10
  #    ProUCL Kolmogorov-Smirnov Gamma GOF                        
  #      Test Statistic:            D = 0.1035271
  #      P-value:                   >= 0.10
  #
  #  Lognormal                      
  #    Shapiro-Wilk GOF                    
  #      Test Statistic:            W = 0.9532604
  #      P-value:                   0.3414187
  #    Lilliefors (Kolmogorov-Smirnov) GOF                    
  #      Test Statistic:            D = 0.115588
  #      P-value:                   0.5899259

  #--------------------

  # Clean up
  #---------

  rm(dat, censored, dat.censored)

  #====================================================================

  # Check the assumption that the silver data stored in Helsel.Cohn.88.silver.df 
  # follows a lognormal distribution.  
  # Note that the small p-value and the shape of the Q-Q plot 
  # (an inverted S-shape) suggests that the log transformation is not quite strong 
  # enough to "bring in" the tails (i.e., the log-transformed silver data has tails 
  # that are slightly too long relative to a normal distribution).  
  # Helsel and Cohn (1988, p.2002) note that the gross outlier of 560 mg/L tends to 
  # make the shape of the data resemble a gamma distribution, but 
  # the distChooseCensored function decision is neither Gamma nor Lognormal, 
  # but instead Nonparametric.

  # First create a lognormal Q-Q plot
  #----------------------------------

  dev.new()
  with(Helsel.Cohn.88.silver.df, 
    qqPlotCensored(Ag, Censored, distribution = "lnorm", 
      points.col = "blue", add.line = TRUE))

  #----------

  # Now call the distChooseCensored function using the default settings.
  #---------------------------------------------------------------------

  with(Helsel.Cohn.88.silver.df, 
    distChooseCensored(Ag, Censored))

  #Results of Choosing Distribution
  #--------------------------------
  #
  #Candidate Distributions:         Normal
  #                                 Gamma
  #                                 Lognormal
  #
  #Choice Method:                   Shapiro-Francia
  #
  #Type I Error per Test:           0.05
  #
  #Decision:                        Nonparametric
  #
  #Data:                            Ag
  #
  #Sample Size:                     56
  #
  #Censoring Side:                  left
  #
  #Censoring Variable:              Censored
  #
  #Censoring Level(s):               0.1  0.2  0.3  0.5  1.0  2.0  2.5  5.0  6.0 10.0 20.0 25.0 
  #
  #Percent Censored:                60.71429%
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              W = 0.3065529
  #    P-value:                     8.346126e-08
  #
  #  Gamma                          
  #    Test Statistic:              W = 0.6254148
  #    P-value:                     1.884155e-05
  #
  #  Lognormal                      
  #    Test Statistic:              W = 0.8957198
  #    P-value:                     0.03490314

  #----------
  
  # Clean up
  #---------

  graphics.off()

  #====================================================================

  # Chapter 15 of USEPA (2009) gives several examples of looking 
  # at normal Q-Q plots and estimating the mean and standard deviation 
  # for manganese concentrations (ppb) in groundwater at five background 
  # wells (USEPA, 2009, p. 15-10).  The Q-Q plot shown in Figure 15-4 
  # on page 15-13 clearly indicates that the Lognormal distribution 
  # is a good fit for these data.
  # In EnvStats these data are stored in the data frame EPA.09.Ex.15.1.manganese.df.

  # Here we will call the distChooseCensored function to determine 
  # whether the data appear to come from a normal, gamma, or lognormal  
  # distribution.
  #
  # Note that using the Probability Plot Correlation Coefficient method 
  # (equivalent to using the Shapiro-Francia method) yields a decision of 
  # Lognormal, but using the ProUCL method yields a decision of Gamma.
  #----------------------------------------------------------------------


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


  # Use distChooseCensored with the probability plot correlation method,
  # and for the gamma and lognormal distribution specify the 
  # mean and CV parameterization:
  #------------------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    distChooseCensored(Manganese.ppb, Censored, 
      choices = c("norm", "gamma", "lnormAlt"), method = "ppcc"))

  #Results of Choosing Distribution
  #--------------------------------
  #
  #Candidate Distributions:         Normal
  #                                 Gamma
  #                                 Lognormal
  #
  #Choice Method:                   PPCC
  #
  #Type I Error per Test:           0.05
  #
  #Decision:                        Lognormal
  #
  #Estimated Parameter(s):          mean = 23.003987
  #                                 cv   =  2.300772
  #
  #Estimation Method:               MLE
  #
  #Data:                            Manganese.ppb
  #
  #Sample Size:                     25
  #
  #Censoring Side:                  left
  #
  #Censoring Variable:              Censored
  #
  #Censoring Level(s):              2 5 
  #
  #Percent Censored:                24%
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              r = 0.9147686
  #    P-value:                     0.004662658
  #
  #  Gamma                          
  #    Test Statistic:              r = 0.9844875
  #    P-value:                     0.6836625
  #
  #  Lognormal                      
  #    Test Statistic:              r = 0.9931982
  #    P-value:                     0.9767731

  #--------------------

  # Repeat the above example using the ProUCL method.
  #--------------------------------------------------

  with(EPA.09.Ex.15.1.manganese.df,
    distChooseCensored(Manganese.ppb, Censored, method = "proucl"))

  #Results of Choosing Distribution
  #--------------------------------
  #
  #Candidate Distributions:         Normal
  #                                 Gamma
  #                                 Lognormal
  #
  #Choice Method:                   ProUCL
  #
  #Type I Error per Test:           0.05
  #
  #Decision:                        Gamma
  #
  #Estimated Parameter(s):          shape =  1.284882
  #                                 scale = 19.813413
  #
  #Estimation Method:               MLE
  #
  #Data:                            Manganese.ppb
  #
  #Sample Size:                     25
  #
  #Censoring Side:                  left
  #
  #Censoring Variable:              Censored
  #
  #Censoring Level(s):              2 5 
  #
  #Percent Censored:                24%
  #
  #ProUCL Sample Size:              19
  #
  #Test Results:
  #
  #  Normal                         
  #    Shapiro-Wilk GOF                       
  #      Test Statistic:            W = 0.7423947
  #      P-value:                   0.0001862975
  #    Lilliefors (Kolmogorov-Smirnov) GOF                       
  #      Test Statistic:            D = 0.2768771
  #      P-value:                   0.0004771155
  #
  #  Gamma                          
  #    ProUCL Anderson-Darling Gamma GOF                        
  #      Test Statistic:            A = 0.6857121
  #      P-value:                   0.05 <= p < 0.10
  #    ProUCL Kolmogorov-Smirnov Gamma GOF                        
  #      Test Statistic:            D = 0.1830034
  #      P-value:                   >= 0.10
  #
  #  Lognormal                      
  #    Shapiro-Wilk GOF                    
  #      Test Statistic:            W = 0.969805
  #      P-value:                   0.7725528
  #    Lilliefors (Kolmogorov-Smirnov) GOF                    
  #      Test Statistic:            D = 0.138547
  #      P-value:                   0.4385195

  #====================================================================

  ## Not run: 
##D   # 1) Simulate 1000 trials where for each trial you:
##D   #    a) Generate 30 observations from a Gamma distribution with 
##D   #       parameters mean = 10 and CV = 1.
##D   #    b) Censor observations less than 5 (the 39th percentile).
##D   #    c) Use distChooseCensored with the Shapiro-Francia method.
##D   #    d) Use distChooseCensored with the ProUCL method.
##D   #
##D   #  2) Compare the proportion of times the 
##D   #     Normal vs. Gamma vs. Lognormal vs. Nonparametric distribution 
##D   #     is chosen for c) and d) above.
##D   #------------------------------------------------------------------
##D 
##D   set.seed(58)
##D   N <- 1000
##D 
##D   Choose.fac <- factor(rep("", N), levels = c("Normal", "Gamma", "Lognormal", "Nonparametric"))
##D   Choose.df <- data.frame(SW = Choose.fac, ProUCL = Choose.fac)
##D 
##D   for(i in 1:N) {
##D     dat <- rgammaAlt(30, mean = 10, cv = 1)
##D     censored <- dat < 5
##D     dat[censored] <- 5
##D     Choose.df[i, "SW"]     <- distChooseCensored(dat, censored, method = "sw")$decision
##D     Choose.df[i, "ProUCL"] <- distChooseCensored(dat, censored, method = "proucl")$decision
##D   }
##D 
##D   summaryStats(Choose.df, digits = 0)
##D 
##D   #                ProUCL(N) ProUCL(Pct) SW(N) SW(Pct)
##D   #Normal              520          52   398      40
##D   #Gamma               336          34   375      38
##D   #Lognormal           105          10   221      22
##D   #Nonparametric        39           4     6       1
##D   #Combined           1000         100  1000     100
##D 
##D   #--------------------
##D 
##D 
##D   # Repeat above example for the Lognormal Distribution with mean=10 and CV = 1.
##D   # In this case, 5 is the 34th percentile.
##D   #-----------------------------------------------------------------------------
##D 
##D   set.seed(297)
##D   N <- 1000
##D 
##D   Choose.fac <- factor(rep("", N), levels = c("Normal", "Gamma", "Lognormal", "Nonparametric"))
##D   Choose.df <- data.frame(SW = Choose.fac, ProUCL = Choose.fac)
##D 
##D   for(i in 1:N) {
##D     dat <- rlnormAlt(30, mean = 10, cv = 1)
##D     censored <- dat < 5
##D     dat[censored] <- 5
##D     Choose.df[i, "SW"]     <- distChooseCensored(dat, censored, method = "sf")$decision
##D     Choose.df[i, "ProUCL"] <- distChooseCensored(dat, censored, method = "proucl")$decision
##D   }
##D 
##D   summaryStats(Choose.df, digits = 0)
##D 
##D   #              ProUCL(N) ProUCL(Pct) SW(N) SW(Pct)
##D   #Normal              277          28    92       9
##D   #Gamma               393          39   231      23
##D   #Lognormal           190          19   624      62
##D   #Nonparametric       140          14    53       5
##D   #Combined           1000         100  1000     100
##D 
##D   #--------------------
##D 
##D 
##D   # Clean up
##D   #---------
##D 
##D   rm(N, Choose.fac, Choose.df, i, dat, censored)
##D   
## End(Not run)




