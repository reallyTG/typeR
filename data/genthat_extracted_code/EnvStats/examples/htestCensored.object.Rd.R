library(EnvStats)


### Name: htestCensored.object
### Title: S3 Class "htestCensored"
### Aliases: htestCensored.object
### Keywords: classes

### ** Examples

  # Create an object of class "htestCensored", then print it out. 
  #--------------------------------------------------------------

  htestCensored.obj <-   with(EPA.09.Ex.16.5.PCE.df, 
    twoSampleLinearRankTestCensored(
      x = PCE.ppb[Well.type == "Compliance"], 
      x.censored = Censored[Well.type == "Compliance"], 
      y = PCE.ppb[Well.type == "Background"], 
      y.censored = Censored[Well.type == "Background"], 
      test = "tarone-ware", alternative = "greater"))

  mode(htestCensored.obj) 
  #[1] "list" 

  class(htestCensored.obj) 
  #[1] "htest" 

  names(htestCensored.obj) 
  # [1] "statistic"         "parameters"        "p.value"          
  # [4] "estimate"          "null.value"        "alternative"      
  # [7] "method"            "estimation.method" "sample.size"      
  #[10] "data.name"         "bad.obs"           "censoring.side"   
  #[13] "censoring.name"    "censoring.levels"  "percent.censored" 
 
  htestCensored.obj 
  
  #Results of Hypothesis Test
  #Based on Censored Data
  #--------------------------
  #
  #Null Hypothesis:                 Fy(t) = Fx(t)
  #
  #Alternative Hypothesis:          Fy(t) > Fx(t) for at least one t
  #
  #Test Name:                       Two-Sample Linear Rank Test:
  #                                 Tarone-Ware Test
  #                                 with Hypergeometric Variance
  #
  #Censoring Side:                  left
  #
  #Data:                            x = PCE.ppb[Well.type == "Compliance"]
  #                                 y = PCE.ppb[Well.type == "Background"]
  #
  #Censoring Variable:              x = Censored[Well.type == "Compliance"]
  #                                 y = Censored[Well.type == "Background"]
  #
  #Sample Sizes:                    nx = 8
  #                                 ny = 6
  #
  #Percent Censored:                x = 12.5%
  #                                 y = 50.0%
  #
  #Test Statistics:                 nu     =  8.458912
  #                                 var.nu = 20.912407
  #                                 z      =  1.849748
  #
  #P-value:                         0.03217495

  #==========

  # Extract the test statistics
  #----------------------------

  htestCensored.obj$statistic
  #       nu    var.nu         z 
  # 8.458912 20.912407  1.849748

  #==========

  # Clean up
  #---------
  rm(htestCensored.obj)



