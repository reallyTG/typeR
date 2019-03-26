library(EnvStats)


### Name: summaryStats.object
### Title: S3 Class "summaryStats"
### Aliases: summaryStats.object
### Keywords: classes

### ** Examples

  # Create an object of class "summaryStats", then print it out. 
  #-------------------------------------------------------------

  summaryStats.obj <- summaryStats(TCE.mg.per.L ~ Well, 
    data = EPA.09.Table.9.1.TCE.df, digits = 3) 

  is.matrix(summaryStats.obj) 
  #[1] TRUE

  class(summaryStats.obj) 
  #[1] "summaryStats" 

  attributes(summaryStats.obj) 
  #$dim
  #[1] 2 8
  #
  #$dimnames
  #$dimnames[[1]]
  #[1] "Well.1" "Well.2"
  #
  #$dimnames[[2]]
  #[1] "N"       "Mean"    "SD"      "Median"  "Min"     "Max"    
  #[7] "NA's"    "N.Total"
  #
  #
  #$class
  #[1] "summaryStats"
  #
  #$stats.in.rows
  #[1] FALSE
  #
  #$drop0trailing
  #[1] TRUE

  summaryStats.obj 
  #        N  Mean    SD Median   Min  Max NA's N.Total
  #Well.1 14 0.063 0.079  0.031 0.004 0.25    1      15
  #Well.2 13 0.118 0.020  0.110 0.099 0.17    2      15

  #----------

  # Clean up
  #---------
  rm(summaryStats.obj)



