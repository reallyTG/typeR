library(EnvStats)


### Name: gofOutlier.object
### Title: S3 Class "gofOutlier"
### Aliases: gofOutlier.object gofOutlier
### Keywords: classes

### ** Examples

  # Create an object of class "gofOutlier", then print it out. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(250) 

  dat <- c(rnorm(30, mean = 3, sd = 2), rnorm(3, mean = 10, sd = 1)) 

  gofOutlier.obj <- rosnerTest(dat, k = 4) 

  mode(gofOutlier.obj) 
  #[1] "list" 

  class(gofOutlier.obj) 
  #[1] "gofOutlier" 

  names(gofOutlier.obj) 
  # [1] "distribution" "statistic"    "sample.size"  "parameters"  
  # [5] "alpha"        "crit.value"   "n.outliers"   "alternative" 
  # [9] "method"       "data"         "data.name"    "bad.obs"     
  #[13] "all.stats"

  gofOutlier.obj 

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

  #==========

  # Extract the data frame with all the test results
  #-------------------------------------------------

  gofOutlier.obj$all.stats
  #  i   Mean.i     SD.i      Value Obs.Num    R.i+1 lambda.i+1 Outlier
  #1 0 3.549744 2.531011 10.7593656      33 2.848514   2.951949    TRUE
  #2 1 3.324444 2.209872 10.1460427      31 3.086875   2.938048    TRUE
  #3 2 3.104392 1.856109  8.7340527      32 3.033044   2.923571    TRUE
  #4 3 2.916737 1.560335 -0.7972275      25 2.380235   2.908473   FALSE

  #==========

  # Clean up
  #---------
  rm(dat, gofOutlier.obj)



