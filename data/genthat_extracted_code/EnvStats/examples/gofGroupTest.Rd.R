library(EnvStats)


### Name: gofGroupTest
### Title: Goodness-of-Fit Test for a Specified Probability Distribution
###   for Groups
### Aliases: gofGroupTest gofGroupTest.formula gofGroupTest.default
###   gofGroupTest.data.frame gofGroupTest.matrix gofGroupTest.list
### Keywords: htest models

### ** Examples

  # Example 10-4 of USEPA (2009, page 10-20) gives an example of 
  # simultaneously testing the assumption of normality for nickel 
  # concentrations (ppb) in groundwater collected at 4 monitoring 
  # wells over 5 months.  The data for this example are stored in 
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


  # Test for a normal distribution at each well:
  #--------------------------------------------

  gofGroup.list <- gofGroupTest(Nickel.ppb ~ Well, 
    data = EPA.09.Ex.10.1.nickel.df)

  gofGroup.list

  #Results of Group Goodness-of-Fit Test
  #-------------------------------------
  #
  #Test Method:                     Wilk-Shapiro GOF (Normal Scores)
  #
  #Hypothesized Distribution:       Normal
  #
  #Data:                            Nickel.ppb
  #
  #Grouping Variable:               Well
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Number of Groups:                4
  #
  #Sample Sizes:                    Well.1 = 5
  #                                 Well.2 = 5
  #                                 Well.3 = 5
  #                                 Well.4 = 5
  #
  #Test Statistic:                  z (G) = -3.658696
  #
  #P-values for
  #Individual Tests:                Well.1 = 0.03510747
  #                                 Well.2 = 0.02385344
  #                                 Well.3 = 0.01120775
  #                                 Well.4 = 0.10681461
  #
  #P-value for
  #Group Test:                      0.0001267509
  #
  #Alternative Hypothesis:          At least one group
  #                                 does not come from a
  #                                 Normal Distribution.

  dev.new()
  plot(gofGroup.list)

  #----------

  # Test for a lognormal distribution at each well:
  #-----------------------------------------------

  gofGroupTest(Nickel.ppb ~ Well, data = EPA.09.Ex.10.1.nickel.df, 
    dist = "lnorm")

  #Results of Group Goodness-of-Fit Test
  #-------------------------------------
  #
  #Test Method:                     Wilk-Shapiro GOF (Normal Scores)
  #
  #Hypothesized Distribution:       Lognormal
  #
  #Data:                            Nickel.ppb
  #
  #Grouping Variable:               Well
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Number of Groups:                4
  #
  #Sample Sizes:                    Well.1 = 5
  #                                 Well.2 = 5
  #                                 Well.3 = 5
  #                                 Well.4 = 5
  #
  #Test Statistic:                  z (G) = 0.2401720
  #
  #P-values for
  #Individual Tests:                Well.1 = 0.6898164
  #                                 Well.2 = 0.6700394
  #                                 Well.3 = 0.3208299
  #                                 Well.4 = 0.5041375
  #
  #P-value for
  #Group Test:                      0.5949015
  #
  #Alternative Hypothesis:          At least one group
  #                                 does not come from a
  #                                 Lognormal Distribution.

  #----------
  # Clean up
  rm(gofGroup.list)
  graphics.off()



