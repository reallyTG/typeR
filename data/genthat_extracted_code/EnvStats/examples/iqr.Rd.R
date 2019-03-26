library(EnvStats)


### Name: iqr
### Title: Interquartile Range
### Aliases: iqr 'Interquartile Range'
### Keywords: univar

### ** Examples

  # Generate 20 observations from a normal distribution with parameters 
  # mean=10 and sd=2, and compute the standard deviation and 
  # interquartile range. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rnorm(20, mean=10, sd=2) 

  sd(dat) 
  #[1] 1.180226
 
  iqr(dat) 
  #[1] 1.489932
 
  #----------

  # Repeat the last example, but add a couple of large "outliers" to the 
  # data.  Note that the estimated standard deviation is greatly affected 
  # by the outliers, while the interquartile range is not.

  summaryStats(dat, quartiles = TRUE) 
  #     N   Mean     SD Median    Min     Max 1st Qu. 3rd Qu.
  #dat 20 9.8612 1.1802 9.6978 7.6042 11.8756  9.1618 10.6517
 
  new.dat <- c(dat, 20, 50) 

  sd(dat) 
  #[1] 1.180226
 
  sd(new.dat) 
  #[1] 8.79796
 
  iqr(dat) 
  #[1] 1.489932
 
  iqr(new.dat) 
  #[1] 1.851472

  #----------
  # Clean up
  rm(dat, new.dat)



