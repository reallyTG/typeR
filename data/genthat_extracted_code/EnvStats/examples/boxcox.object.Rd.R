library(EnvStats)


### Name: boxcox.object
### Title: S3 Class "boxcox"
### Aliases: boxcox.object
### Keywords: classes

### ** Examples

  # Create an object of class "boxcox", then print it out.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rlnormAlt(30, mean = 10, cv = 2) 

  dev.new()
  hist(x, col = "cyan")

  boxcox.list <- boxcox(x)

  data.class(boxcox.list)
  #[1] "boxcox"
  
  names(boxcox.list)
  # [1] "lambda"          "objective"       "objective.name" 
  # [4] "optimize"        "optimize.bounds" "eps"            
  # [7] "data"            "sample.size"     "data.name"      
  #[10] "bad.obs" 

  boxcox.list
  #Results of Box-Cox Transformation
  #---------------------------------
  #
  #Objective Name:                  PPCC
  #
  #Data:                            x
  #
  #Sample Size:                     30
  #
  # lambda      PPCC
  #   -2.0 0.5423739
  #   -1.5 0.6402782
  #   -1.0 0.7818160
  #   -0.5 0.9272219
  #    0.0 0.9921702
  #    0.5 0.9581178
  #    1.0 0.8749611
  #    1.5 0.7827009
  #    2.0 0.7004547

  boxcox(x, optimize = TRUE) 
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
  #Optimal Value:                   lambda = 0.04530789
  #
  #Value of Objective:              PPCC = 0.9925919 

  #----------

  # Clean up
  #---------
  rm(x, boxcox.list)



