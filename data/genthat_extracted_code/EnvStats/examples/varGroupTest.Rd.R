library(EnvStats)


### Name: varGroupTest
### Title: Test for Homogeneity of Variance Among Two or More Groups
### Aliases: varGroupTest varGroupTest.formula varGroupTest.default
###   varGroupTest.data.frame varGroupTest.matrix varGroupTest.list
### Keywords: htest models

### ** Examples

  # Example 11-2 of USEPA (2009, page 11-7) gives an example of 
  # testing the assumption of equal variances across wells for arsenic  
  # concentrations (ppb) in groundwater collected at 6 monitoring 
  # wells over 4 months.  The data for this example are stored in 
  # EPA.09.Ex.11.1.arsenic.df.

  head(EPA.09.Ex.11.1.arsenic.df)
  #  Arsenic.ppb Month Well
  #1        22.9     1    1
  #2         3.1     2    1
  #3        35.7     3    1
  #4         4.2     4    1
  #5         2.0     1    2
  #6         1.2     2    2

  longToWide(EPA.09.Ex.11.1.arsenic.df, "Arsenic.ppb", "Month", "Well", 
    paste.row.name = TRUE, paste.col.name = TRUE)
  #        Well.1 Well.2 Well.3 Well.4 Well.5 Well.6
  #Month.1   22.9    2.0    2.0    7.8   24.9    0.3
  #Month.2    3.1    1.2  109.4    9.3    1.3    4.8
  #Month.3   35.7    7.8    4.5   25.9    0.8    2.8
  #Month.4    4.2   52.0    2.5    2.0   27.0    1.2

  varGroupTest(Arsenic.ppb ~ Well, data = EPA.09.Ex.11.1.arsenic.df)

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 Ratio of each pair of variances = 1
  #
  #Alternative Hypothesis:          At least one variance differs
  #
  #Test Name:                       Levene's Test for
  #                                 Homogenity of Variance
  #
  #Estimated Parameter(s):          Well.1 =  246.8158
  #                                 Well.2 =  592.6767
  #                                 Well.3 = 2831.4067
  #                                 Well.4 =  105.2967
  #                                 Well.5 =  207.4467
  #                                 Well.6 =    3.9025
  #
  #Data:                            Arsenic.ppb
  #
  #Grouping Variable:               Well
  #
  #Data Source:                     EPA.09.Ex.11.1.arsenic.df
  #
  #Sample Sizes:                    Well.1 = 4
  #                                 Well.2 = 4
  #                                 Well.3 = 4
  #                                 Well.4 = 4
  #                                 Well.5 = 4
  #                                 Well.6 = 4
  #
  #Test Statistic:                  F = 4.564176
  #
  #Test Statistic Parameters:       num df   =  5
  #                                 denom df = 18
  #
  #P-value:                         0.007294084



