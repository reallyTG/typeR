library(EnvStats)


### Name: distChoose
### Title: Choose Best Fitting Distribution Based on Goodness-of-Fit Tests
### Aliases: distChoose distChoose.default distChoose.formula
### Keywords: htest models

### ** Examples

  # Generate 20 observations from a gamma distribution with 
  # parameters shape = 2 and scale = 3 and:
  #
  # 1) Call distChoose using the Shapiro-Wilk method.
  #
  # 2) Call distChoose using the Shapiro-Wilk method and specify 
  #    the bias-corrected method of estimating shape for the Gamma 
  #    distribution.
  #
  # 3) Compare the results in 2) above with the results using the
  #    ProUCL method. 
  #
  # Notes:  The call to set.seed lets you reproduce this example.
  #
  #         The ProUCL method chooses the Normal distribution, whereas the 
  #         Shapiro-Wilk method chooses the Gamma distribution.

  set.seed(47)
  dat <- rgamma(20, shape = 2, scale = 3)


  # 1) Call distChoose using the Shapiro-Wilk method.
  #--------------------------------------------------

  distChoose(dat)

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
  #Estimated Parameter(s):          shape = 1.909462
  #                                 scale = 4.056819
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              W = 0.9097488
  #    P-value:                     0.06303695
  #
  #  Gamma                          
  #    Test Statistic:              W = 0.9834958
  #    P-value:                     0.970903
  #
  #  Lognormal                      
  #    Test Statistic:              W = 0.9185006
  #    P-value:                     0.09271768

  #--------------------

  # 2) Call distChoose using the Shapiro-Wilk method and specify 
  #    the bias-corrected method of estimating shape for the Gamma 
  #    distribution.
  #---------------------------------------------------------------

  distChoose(dat, method = "sw", 
    est.arg.list = list(gamma = list(method = "bcmle")))

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
  #Estimated Parameter(s):          shape = 1.656376
  #                                 scale = 4.676680
  #
  #Estimation Method:               Bias-Corrected MLE
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              W = 0.9097488
  #    P-value:                     0.06303695
  #
  #  Gamma                          
  #    Test Statistic:              W = 0.9834346
  #    P-value:                     0.9704046
  #
  #  Lognormal                      
  #    Test Statistic:              W = 0.9185006
  #    P-value:                     0.09271768

  #--------------------

  # 3) Compare the results in 2) above with the results using the
  #    ProUCL method. 
  #---------------------------------------------------------------

  distChoose(dat, method = "proucl")

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
  #Estimated Parameter(s):          mean = 7.746340
  #                                 sd   = 5.432175
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Results:
  #
  #  Normal                         
  #    Shapiro-Wilk GOF                       
  #      Test Statistic:            W = 0.9097488
  #      P-value:                   0.06303695
  #    Lilliefors (Kolmogorov-Smirnov) GOF                       
  #      Test Statistic:            D = 0.1547851
  #      P-value:                   0.238092
  #
  #  Gamma                          
  #    ProUCL Anderson-Darling Gamma GOF                        
  #      Test Statistic:            A = 0.1853826
  #      P-value:                   >= 0.10
  #    ProUCL Kolmogorov-Smirnov Gamma GOF                        
  #      Test Statistic:            D = 0.0988692
  #      P-value:                   >= 0.10
  #
  #  Lognormal                      
  #    Shapiro-Wilk GOF                    
  #      Test Statistic:            W = 0.9185006
  #      P-value:                   0.09271768
  #    Lilliefors (Kolmogorov-Smirnov) GOF                    
  #      Test Statistic:            D = 0.149317
  #      P-value:                   0.2869177

  #--------------------

  # Clean up
  #---------

  rm(dat)

  #====================================================================

  # Example 10-2 of USEPA (2009, page 10-14) gives an example of 
  # using the Shapiro-Wilk test to test the assumption of normality 
  # for nickel concentrations (ppb) in groundwater collected over 
  # 4 years.  The data for this example are stored in 
  # EPA.09.Ex.10.1.nickel.df.

  EPA.09.Ex.10.1.nickel.df
  #   Month   Well Nickel.ppb
  #1      1 Well.1       58.8
  #2      3 Well.1        1.0
  #3      6 Well.1      262.0
  #4      8 Well.1       56.0
  #5     10 Well.1        8.7
  #6      1 Well.2       19.0
  #7      3 Well.2       81.5
  #8      6 Well.2      331.0
  #9      8 Well.2       14.0
  #10    10 Well.2       64.4
  #11     1 Well.3       39.0
  #12     3 Well.3      151.0
  #13     6 Well.3       27.0
  #14     8 Well.3       21.4
  #15    10 Well.3      578.0
  #16     1 Well.4        3.1
  #17     3 Well.4      942.0
  #18     6 Well.4       85.6
  #19     8 Well.4       10.0
  #20    10 Well.4      637.0

  # Use distChoose with the probability plot correlation method,
  # and for the lognormal distribution specify the 
  # mean and CV parameterization:
  #------------------------------------------------------------

  distChoose(Nickel.ppb ~ 1, data = EPA.09.Ex.10.1.nickel.df, 
    choices = c("norm", "gamma", "lnormAlt"), method = "ppcc")

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
  #Estimated Parameter(s):          mean = 213.415628
  #                                 cv   =   2.809377
  #
  #Estimation Method:               mvue
  #
  #Data:                            Nickel.ppb
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Sample Size:                     20
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              r = 0.8199825
  #    P-value:                     5.753418e-05
  #
  #  Gamma                          
  #    Test Statistic:              r = 0.9749044
  #    P-value:                     0.317334
  #
  #  Lognormal                      
  #    Test Statistic:              r = 0.9912528
  #    P-value:                     0.9187852

  #--------------------

  # Repeat the above example using the ProUCL method.
  #--------------------------------------------------

  distChoose(Nickel.ppb ~ 1, data = EPA.09.Ex.10.1.nickel.df, 
    method = "proucl")

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
  #Estimated Parameter(s):          shape =   0.5198727
  #                                 scale = 326.0894272
  #
  #Estimation Method:               MLE
  #
  #Data:                            Nickel.ppb
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Sample Size:                     20
  #
  #Test Results:
  #
  #  Normal                         
  #    Shapiro-Wilk GOF                       
  #      Test Statistic:            W = 0.6788888
  #      P-value:                   2.17927e-05
  #    Lilliefors (Kolmogorov-Smirnov) GOF                       
  #      Test Statistic:            D = 0.3267052
  #      P-value:                   5.032807e-06
  #
  #  Gamma                          
  #    ProUCL Anderson-Darling Gamma GOF                        
  #      Test Statistic:            A = 0.5076725
  #      P-value:                   >= 0.10
  #    ProUCL Kolmogorov-Smirnov Gamma GOF                        
  #      Test Statistic:            D = 0.1842904
  #      P-value:                   >= 0.10
  #
  #  Lognormal                      
  #    Shapiro-Wilk GOF                    
  #      Test Statistic:            W = 0.978946
  #      P-value:                   0.9197735
  #    Lilliefors (Kolmogorov-Smirnov) GOF                    
  #      Test Statistic:            D = 0.08405167
  #      P-value:                   0.9699648

  #====================================================================

  ## Not run: 
##D   # 1) Simulate 1000 trials where for each trial you:
##D   #    a) Generate 20 observations from a Gamma distribution with 
##D   #       parameters mean = 10 and CV = 1.
##D   #    b) Use distChoose with the Shapiro-Wilk method.
##D   #    c) Use distChoose with the ProUCL method.
##D   #
##D   #  2) Compare the proportion of times the 
##D   #     Normal vs. Gamma vs. Lognormal vs. Nonparametric distribution 
##D   #     is chosen for b) and c) above.
##D   #------------------------------------------------------------------
##D 
##D   set.seed(58)
##D   N <- 1000
##D 
##D   Choose.fac <- factor(rep("", N), levels = c("Normal", "Gamma", "Lognormal", "Nonparametric"))
##D   Choose.df <- data.frame(SW = Choose.fac, ProUCL = Choose.fac)
##D 
##D   for(i in 1:N) {
##D     dat <- rgammaAlt(20, mean = 10, cv = 1)
##D     Choose.df[i, "SW"]     <- distChoose(dat, method = "sw")$decision
##D     Choose.df[i, "ProUCL"] <- distChoose(dat, method = "proucl")$decision
##D   }
##D 
##D   summaryStats(Choose.df, digits = 0)
##D 
##D   #              ProUCL(N) ProUCL(Pct) SW(N) SW(Pct)
##D   #Normal              443          44    41       4
##D   #Gamma               546          55   733      73
##D   #Lognormal             9           1   215      22
##D   #Nonparametric         2           0    11       1
##D   #Combined           1000         100  1000     100
##D 
##D 
##D   #--------------------
##D 
##D 
##D   # Repeat above example for the Lognormal Distribution with mean=10 and CV = 1.
##D   #-----------------------------------------------------------------------------
##D 
##D   set.seed(297)
##D   N <- 1000
##D 
##D   Choose.fac <- factor(rep("", N), levels = c("Normal", "Gamma", "Lognormal", "Nonparametric"))
##D   Choose.df <- data.frame(SW = Choose.fac, ProUCL = Choose.fac)
##D 
##D   for(i in 1:N) {
##D     dat <- rlnormAlt(20, mean = 10, cv = 1)
##D     Choose.df[i, "SW"]     <- distChoose(dat, method = "sw")$decision
##D     Choose.df[i, "ProUCL"] <- distChoose(dat, method = "proucl")$decision
##D   }
##D 
##D   summaryStats(Choose.df, digits = 0)
##D 
##D   #              ProUCL(N) ProUCL(Pct) SW(N) SW(Pct)
##D   #Normal              313          31    15       2
##D   #Gamma               556          56   254      25
##D   #Lognormal           121          12   706      71
##D   #Nonparametric        10           1    25       2
##D   #Combined           1000         100  1000     100
##D 
##D 
##D   #--------------------
##D 
##D 
##D   # Clean up
##D   #---------
##D 
##D   rm(N, Choose.fac, Choose.df, i, dat)
##D   
## End(Not run)




