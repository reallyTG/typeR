library(EnvStats)


### Name: cdfCompareCensored
### Title: Plot Two Cumulative Distribution Functions Based on Censored
###   Data
### Aliases: cdfCompareCensored 'Compare CDFs for Censored Data'
### Keywords: distribution hplot

### ** Examples

  # Generate 20 observations from a normal distribution with mean=20 and sd=5, 
  # censor all observations less than 18, then compare the empirical cdf with a 
  # theoretical normal cdf that is based on estimating the parameters. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(333) 
  x <- sort(rnorm(20, mean=20, sd=5))
  x
  # [1]  9.743551 12.370197 14.375499 15.628482 15.883507 17.080124
  # [7] 17.197588 18.097714 18.654182 19.585942 20.219308 20.268505
  #[13] 20.552964 21.388695 21.763587 21.823639 23.168039 26.165269
  #[19] 26.843362 29.673405

  censored <- x < 18
  x[censored] <- 18

  sum(censored) 
  #[1] 7 

  dev.new()
  cdfCompareCensored(x, censored)

  # Clean up
  #---------
  rm(x, censored)

  #==========

  # Example 15-1 of USEPA (2009, page 15-10) gives an example of
  # computing plotting positions based on censored manganese 
  # concentrations (ppb) in groundwater collected at 5 monitoring
  # wells.  The data for this example are stored in 
  # EPA.09.Ex.15.1.manganese.df.  Here we will compare the empirical 
  # cdf based on Kaplan-Meier plotting positions or Michael-Schucany 
  # plotting positions with various assumed distributions 
  # (based on estimating the parameters of these distributions):
  # 1) normal distribution
  # 2) lognormal distribution
  # 3) gamma distribution

  # First look at the data:
  #------------------------

  EPA.09.Ex.15.1.manganese.df
  #   Sample   Well Manganese.Orig.ppb Manganese.ppb Censored
  #1       1 Well.1                 <5           5.0     TRUE
  #2       2 Well.1               12.1          12.1    FALSE
  #3       3 Well.1               16.9          16.9    FALSE
  #4       4 Well.1               21.6          21.6    FALSE
  #5       5 Well.1                 <2           2.0     TRUE
  #...
  #21      1 Well.5               17.9          17.9    FALSE
  #22      2 Well.5               22.7          22.7    FALSE
  #23      3 Well.5                3.3           3.3    FALSE
  #24      4 Well.5                8.4           8.4    FALSE
  #25      5 Well.5                 <2           2.0     TRUE

  longToWide(EPA.09.Ex.15.1.manganese.df, 
    "Manganese.Orig.ppb", "Sample", "Well",
    paste.row.name = TRUE)  

  #         Well.1 Well.2 Well.3 Well.4 Well.5
  #Sample.1     <5     <5     <5    6.3   17.9
  #Sample.2   12.1    7.7    5.3   11.9   22.7
  #Sample.3   16.9   53.6   12.6     10    3.3
  #Sample.4   21.6    9.5  106.3     <2    8.4
  #Sample.5     <2   45.9   34.5   77.2     <2


  # Assume a normal distribution
  #-----------------------------

  # Michael-Schucany plotting positions:
  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    cdfCompareCensored(Manganese.ppb, Censored))

  # Kaplan-Meier plotting positions:
  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    cdfCompareCensored(Manganese.ppb, Censored, 
      prob.method = "kaplan-meier"))


  # Assume a lognormal distribution
  #--------------------------------

  # Michael-Schucany plotting positions:
  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    cdfCompareCensored(Manganese.ppb, Censored, dist = "lnorm"))

  # Kaplan-Meier plotting positions:
  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    cdfCompareCensored(Manganese.ppb, Censored, dist = "lnorm", 
      prob.method = "kaplan-meier"))


  # Assume a gamma distribution
  #----------------------------

  # Michael-Schucany plotting positions:
  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    cdfCompareCensored(Manganese.ppb, Censored, dist = "gamma"))

  # Kaplan-Meier plotting positions:
  dev.new()
  with(EPA.09.Ex.15.1.manganese.df, 
    cdfCompareCensored(Manganese.ppb, Censored, dist = "gamma", 
      prob.method = "kaplan-meier"))

  # Clean up
  #---------
  graphics.off()

  #==========

  # Compare the distributions of copper and zinc between the Alluvial Fan Zone 
  # and the Basin-Trough Zone using the data of Millard and Deverel (1988).  
  # The data are stored in Millard.Deverel.88.df.

  Millard.Deverel.88.df
  #    Cu.orig Cu Cu.censored Zn.orig  Zn Zn.censored         Zone Location
  #1       < 1  1        TRUE     <10  10        TRUE Alluvial.Fan        1
  #2       < 1  1        TRUE       9   9       FALSE Alluvial.Fan        2
  #3         3  3       FALSE      NA  NA       FALSE Alluvial.Fan        3
  #.
  #.
  #.
  #116       5  5       FALSE      50  50       FALSE Basin.Trough       48
  #117      14 14       FALSE      90  90       FALSE Basin.Trough       49
  #118       4  4       FALSE      20  20       FALSE Basin.Trough       50

  Cu.AF <- with(Millard.Deverel.88.df, 
    Cu[Zone == "Alluvial.Fan"])

  Cu.AF.cen <- with(Millard.Deverel.88.df, 
    Cu.censored[Zone == "Alluvial.Fan"]) 

  Cu.BT <- with(Millard.Deverel.88.df, 
    Cu[Zone == "Basin.Trough"])

  Cu.BT.cen <- with(Millard.Deverel.88.df, 
    Cu.censored[Zone == "Basin.Trough"])

  Zn.AF <- with(Millard.Deverel.88.df, 
    Zn[Zone == "Alluvial.Fan"])

  Zn.AF.cen <- with(Millard.Deverel.88.df, 
    Zn.censored[Zone == "Alluvial.Fan"])

  Zn.BT <- with(Millard.Deverel.88.df, 
    Zn[Zone == "Basin.Trough"])

  Zn.BT.cen <- with(Millard.Deverel.88.df, 
    Zn.censored[Zone == "Basin.Trough"])


  # First compare the copper concentrations 
  #----------------------------------------
  dev.new()
  cdfCompareCensored(x = Cu.AF, censored = Cu.AF.cen, 
    y = Cu.BT, y.censored = Cu.BT.cen) 


  # Now compare the zinc concentrations 
  #------------------------------------
  dev.new()
  cdfCompareCensored(x = Zn.AF, censored = Zn.AF.cen, 
    y = Zn.BT, y.censored = Zn.BT.cen) 


  # Compare the Zinc concentrations again, but delete 
  # the one "outlier".
  #--------------------------------------------------

  summaryStats(Zn.AF) 
  #       N    Mean      SD Median Min Max NA's N.Total
  #Zn.AF 67 23.5075 74.4192     10   3 620    1      68

  summaryStats(Zn.BT) 
  #       N  Mean      SD Median Min Max
  #Zn.BT 50 21.94 18.7044   18.5   3  90

  which(Zn.AF == 620)
  #[1] 38

  summaryStats(Zn.AF[-38]) 
  #            N    Mean     SD Median Min Max NA's N.Total
  #Zn.AF[-38] 66 14.4697 8.1604     10   3  50    1      67


  dev.new()
  cdfCompareCensored(x = Zn.AF[-38], censored = Zn.AF.cen[-38], 
    y = Zn.BT, y.censored = Zn.BT.cen) 

  #----------

  # Clean up
  #---------

  rm(Cu.AF, Cu.AF.cen, Cu.BT, Cu.BT.cen, 
     Zn.AF, Zn.AF.cen, Zn.BT, Zn.BT.cen)
  graphics.off()



