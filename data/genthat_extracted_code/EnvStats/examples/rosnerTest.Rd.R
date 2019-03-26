library(EnvStats)


### Name: rosnerTest
### Title: Rosner's Test for Outliers
### Aliases: rosnerTest 'outlier test' 'Outlier Test' Rosner
### Keywords: htest models

### ** Examples

  # Combine 30 observations from a normal distribution with mean 3 and 
  # standard deviation 2, with 3 observations from a normal distribution 
  # with mean 10 and standard deviation 1, then run Rosner's Test on these 
  # data, specifying k=4 potential outliers based on looking at the 
  # normal Q-Q plot. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(250) 

  dat <- c(rnorm(30, mean = 3, sd = 2), rnorm(3, mean = 10, sd = 1)) 

  dev.new()
  qqPlot(dat)

  rosnerTest(dat, k = 4)

  #Results of Outlier Test
  #-------------------------
  #
  #Test Method:                     Rosner's Test for Outliers
  #
  #Hypothesized Distribution:       Normal
  #
  #Data:                            dat
  #
  #Sample Size:                     33
  #
  #Test Statistics:                 R.1 = 2.848514
  #                                 R.2 = 3.086875
  #                                 R.3 = 3.033044
  #                                 R.4 = 2.380235
  #
  #Test Statistic Parameter:        k = 4
  #
  #Alternative Hypothesis:          Up to 4 observations are not
  #                                 from the same Distribution.
  #
  #Type I Error:                    5%
  #
  #Number of Outliers Detected:     3
  #
  #  i   Mean.i     SD.i      Value Obs.Num    R.i+1 lambda.i+1 Outlier
  #1 0 3.549744 2.531011 10.7593656      33 2.848514   2.951949    TRUE
  #2 1 3.324444 2.209872 10.1460427      31 3.086875   2.938048    TRUE
  #3 2 3.104392 1.856109  8.7340527      32 3.033044   2.923571    TRUE
  #4 3 2.916737 1.560335 -0.7972275      25 2.380235   2.908473   FALSE

  #----------
  # Clean up

  rm(dat)
  graphics.off()

  #--------------------------------------------------------------------

  # Example 12-4 of USEPA (2009, page 12-12) gives an example of 
  # using Rosner's test to test for outliers in napthalene measurements (ppb)
  # taken at 5 background wells over 5 quarters.  The data for this example 
  # are stored in EPA.09.Ex.12.4.naphthalene.df.

  EPA.09.Ex.12.4.naphthalene.df
  #   Quarter Well Naphthalene.ppb
  #1        1 BW.1            3.34
  #2        2 BW.1            5.39
  #3        3 BW.1            5.74
  # ...
  #23       3 BW.5            5.53
  #24       4 BW.5            4.42
  #25       5 BW.5           35.45

  longToWide(EPA.09.Ex.12.4.naphthalene.df, "Naphthalene.ppb", "Quarter", "Well", 
    paste.row.name = TRUE)
  #          BW.1 BW.2  BW.3 BW.4  BW.5
  #Quarter.1 3.34 5.59  1.91 6.12  8.64
  #Quarter.2 5.39 5.96  1.74 6.05  5.34
  #Quarter.3 5.74 1.47 23.23 5.18  5.53
  #Quarter.4 6.88 2.57  1.82 4.43  4.42
  #Quarter.5 5.85 5.39  2.02 1.00 35.45


  # Look at Q-Q plots for both the raw and log-transformed data
  #------------------------------------------------------------

  dev.new()
  with(EPA.09.Ex.12.4.naphthalene.df, 
    qqPlot(Naphthalene.ppb, add.line = TRUE, 
      main = "Figure 12-6.  Naphthalene Probability Plot"))

  dev.new()
  with(EPA.09.Ex.12.4.naphthalene.df, 
    qqPlot(Naphthalene.ppb, dist = "lnorm", add.line = TRUE, 
      main = "Figure 12-7.  Log Naphthalene Probability Plot"))


  # Test for 2 potential outliers on the original scale:
  #-----------------------------------------------------

  with(EPA.09.Ex.12.4.naphthalene.df, rosnerTest(Naphthalene.ppb, k = 2))

  #Results of Outlier Test
  #-------------------------
  #
  #Test Method:                     Rosner's Test for Outliers
  #
  #Hypothesized Distribution:       Normal
  #
  #Data:                            Naphthalene.ppb
  #
  #Sample Size:                     25
  #
  #Test Statistics:                 R.1 = 3.930957
  #                                 R.2 = 4.160223
  #
  #Test Statistic Parameter:        k = 2
  #
  #Alternative Hypothesis:          Up to 2 observations are not
  #                                 from the same Distribution.
  #
  #Type I Error:                    5%
  #
  #Number of Outliers Detected:     2
  #
  #  i  Mean.i     SD.i Value Obs.Num    R.i+1 lambda.i+1 Outlier
  #1 0 6.44240 7.379271 35.45      25 3.930957   2.821681    TRUE
  #2 1 5.23375 4.325790 23.23      13 4.160223   2.801551    TRUE

  #----------
  # Clean up

  graphics.off()



