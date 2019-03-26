library(EnvStats)


### Name: boxcoxCensored.object
### Title: S3 Class "boxcoxCensored"
### Aliases: boxcoxCensored.object
### Keywords: classes

### ** Examples

  # Create an object of class "boxcoxCensored", then print it out.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 

  x.1 <- rlnormAlt(15, mean = 10, cv = 2) 
  censored.1 <- x.1 < 2
  x.1[censored.1] <- 2

  x.2 <- rlnormAlt(15, mean = 10, cv = 2) 
  censored.2 <- x.2 < 4
  x.2[censored.2] <- 4

  x <- c(x.1, x.2)
  censored <- c(censored.1, censored.2)

  boxcox.list <- boxcoxCensored(x, censored)

  data.class(boxcox.list)
  #[1] "boxcoxCensored"
  
  names(boxcox.list)
  # [1] "lambda"           "objective"        "objective.name"  
  # [4] "optimize"         "optimize.bounds"  "eps"             
  # [7] "data"             "censored"         "sample.size"     
  #[10] "censoring.side"   "censoring.levels" "percent.censored"
  #[13] "data.name"        "censoring.name"   "bad.obs"

  boxcox.list

  #Results of Box-Cox Transformation
  #Based on Type I Censored Data
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 4 
  #
  #Sample Size:                     30
  #
  #Percent Censored:                26.7%
  #
  # lambda      PPCC
  #   -2.0 0.8954683
  #   -1.5 0.9338467
  #   -1.0 0.9643680
  #   -0.5 0.9812969
  #    0.0 0.9776834
  #    0.5 0.9471025
  #    1.0 0.8901990
  #    1.5 0.8187488
  #    2.0 0.7480494

  boxcox.list2 <- boxcox(x, optimize = TRUE) 
  names(boxcox.list2)
  # [1] "lambda"          "objective"       "objective.name" 
  # [4] "optimize"        "optimize.bounds" "eps"            
  # [7] "data"            "sample.size"     "data.name"      
  #[10] "bad.obs"

  boxcox.list2
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Sample Size:                     30
  #
  #Bounds for Optimization:         lower = -2
  #                                 upper =  2
  #
  #Optimal Value:                   lambda = -0.5826431
  #
  #Value of Objective:              PPCC = 0.9755402

  #==========

  # Clean up
  #---------
  rm(x.1, censored.1, x.2, censored.2, x, censored, boxcox.list, boxcox.list2)



