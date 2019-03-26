library(EnvStats)


### Name: summaryStats
### Title: Summary Statistics
### Aliases: summaryStats summaryStats.formula summaryStats.default
###   summaryStats.factor summaryStats.logical summaryStats.character
###   summaryStats.data.frame summaryStats.matrix summaryStats.list
### Keywords: univar htest

### ** Examples

  # The guidance document USEPA (1994b, pp. 6.22--6.25)
  # contains measures of 1,2,3,4-Tetrachlorobenzene (TcCB)
  # concentrations (in parts per billion) from soil samples
  # at a Reference area and a Cleanup area. These data are strored
  # in the data frame EPA.94b.tccb.df.

  #----------
  # First, create summary statistics by area based on the log-transformed data. 

  summaryStats(log10(TcCB) ~ Area, data = EPA.94b.tccb.df)
  #           N    Mean     SD  Median     Min    Max
  #Cleanup   77 -0.2377 0.5908 -0.3665 -1.0458 2.2270
  #Reference 47 -0.2691 0.2032 -0.2676 -0.6576 0.1239

  #----------
  # Now create summary statistics by area based on the log-transformed data 
  # and use the t-test to compare the areas.

  summaryStats(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, p.value = TRUE)

  summaryStats(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, 
    p.value = TRUE, stats.in.rows = TRUE)
  #                Cleanup  Reference Combined
  #N                77       47       124     
  #Mean             -0.2377  -0.2691   -0.2496
  #SD                0.5908   0.2032    0.481 
  #Median           -0.3665  -0.2676   -0.3143
  #Min              -1.0458  -0.6576   -1.0458
  #Max               2.227    0.1239    2.227 
  #Diff                                -0.0313
  #p.value.between                      0.73  
  #95%.LCL.between                     -0.2082
  #95%.UCL.between                      0.1456

  #====================================================================

  # Page 9-3 of USEPA (2009) lists trichloroethene 
  # concentrations (TCE; mg/L) collected from groundwater at two wells.
  # Here, the seven non-detects have been set to their detection limit.

  #----------
  # First, compute summary statistics for all TCE observations.

  summaryStats(TCE.mg.per.L ~ 1, data = EPA.09.Table.9.1.TCE.df, 
    digits = 3, data.name = "TCE")
  #     N Mean    SD Median   Min  Max NA's N.Total
  #TCE 27 0.09 0.064    0.1 0.004 0.25    3      30

  summaryStats(TCE.mg.per.L ~ 1, data = EPA.09.Table.9.1.TCE.df,
    se = TRUE, quartiles = TRUE, digits = 3, data.name = "TCE")
  #     N Mean    SD    SE Median   Min  Max 1st Qu. 3rd Qu. NA's N.Total
  #TCE 27 0.09 0.064 0.012    0.1 0.004 0.25   0.031    0.12    3      30

  #----------
  # Now compute summary statistics by well.

  summaryStats(TCE.mg.per.L ~ Well, data = EPA.09.Table.9.1.TCE.df, 
    digits = 3)
  #        N  Mean    SD Median   Min  Max NA's N.Total
  #Well.1 14 0.063 0.079  0.031 0.004 0.25    1      15
  #Well.2 13 0.118 0.020  0.110 0.099 0.17    2      15

  summaryStats(TCE.mg.per.L ~ Well, data = EPA.09.Table.9.1.TCE.df,
    digits = 3, stats.in.rows = TRUE)
  #        Well.1 Well.2
  #N       14     13    
  #Mean     0.063  0.118
  #SD       0.079  0.02 
  #Median   0.031  0.11 
  #Min      0.004  0.099
  #Max      0.25   0.17 
  #NA's     1      2    
  #N.Total 15     15 

  # If you want to keep trailing 0's, use the drop0trailing argument:
  summaryStats(TCE.mg.per.L ~ Well, data = EPA.09.Table.9.1.TCE.df,
    digits = 3, stats.in.rows = TRUE, drop0trailing = FALSE)
  #        Well.1 Well.2
  #N       14.000 13.000
  #Mean     0.063  0.118
  #SD       0.079  0.020
  #Median   0.031  0.110
  #Min      0.004  0.099
  #Max      0.250  0.170
  #NA's     1.000  2.000
  #N.Total 15.000 15.000

  #====================================================================

  # Page 13-3 of USEPA (2009) lists iron concentrations (ppm) in 
  # groundwater collected from 6 wells.  

  #----------
  # First, compute summary statistics for each well.

  summaryStats(Iron.ppm ~ Well, data = EPA.09.Ex.13.1.iron.df, 
    combine.groups = FALSE, digits = 2, stats.in.rows = TRUE)
  #       Well.1 Well.2 Well.3 Well.4 Well.5 Well.6
  #N        4      4      4      4      4      4   
  #Mean    47.01  55.73  90.86  70.43 145.24 156.32
  #SD      12.4   20.34  59.35  25.95  92.16  51.2 
  #Median  50.05  57.05  76.73  76.95 137.66 171.93
  #Min     29.96  32.14  39.25  34.12  60.95  83.1 
  #Max     57.97  76.71 170.72  93.69 244.69 198.34

  #----------
  # Note the large differences in standard deviations between wells.
  # Compute summary statistics for log(Iron), by Well.

  summaryStats(log(Iron.ppm) ~ Well, data = EPA.09.Ex.13.1.iron.df, 
    combine.groups = FALSE, digits = 2, stats.in.rows = TRUE)
  #       Well.1 Well.2 Well.3 Well.4 Well.5 Well.6
  #N      4      4      4      4      4      4     
  #Mean   3.82   3.97   4.35   4.19   4.8    5     
  #SD     0.3    0.4    0.66   0.45   0.7    0.4   
  #Median 3.91   4.02   4.29   4.34   4.8    5.14  
  #Min    3.4    3.47   3.67   3.53   4.11   4.42  
  #Max    4.06   4.34   5.14   4.54   5.5    5.29

  #----------
  # Include confidence intervals for the mean log(Fe) concentration
  # at each well, and also the p-value from the one-way 
  # analysis of variance to test for a difference in well means.

  summaryStats(log(Iron.ppm) ~ Well, data = EPA.09.Ex.13.1.iron.df, 
    digits = 1, ci = TRUE, p.value = TRUE, stats.in.rows = TRUE)
  #                Well.1 Well.2 Well.3 Well.4 Well.5 Well.6 Combined
  #N                4      4      4      4      4      4     24      
  #Mean             3.8    4      4.3    4.2    4.8    5      4.4    
  #SD               0.3    0.4    0.7    0.5    0.7    0.4    0.6    
  #Median           3.9    4      4.3    4.3    4.8    5.1    4.3    
  #Min              3.4    3.5    3.7    3.5    4.1    4.4    3.4    
  #Max              4.1    4.3    5.1    4.5    5.5    5.3    5.5    
  #95%.LCL          3.3    3.3    3.3    3.5    3.7    4.4    4.1    
  #95%.UCL          4.3    4.6    5.4    4.9    5.9    5.6    4.6    
  #p.value.between                                            0.025 

  #====================================================================

  # Using the built-in dataset HairEyeColor, summarize the frequencies 
  # of hair color and test whether there is a difference in proportions.
  # NOTE:  The data that was originally factor data has already been 
  #        collapsed into frequency counts by catetory in the object 
  #        HairEyeColor.  In the examples in this section, we recreate 
  #        the factor objects in order to show how summaryStats works 
  #        for factor objects.

  Hair <- apply(HairEyeColor, 1, sum)
  Hair
  #Black Brown   Red Blond 
  #  108   286    71   127

  Hair.color <- names(Hair)
  Hair.fac <- factor(rep(Hair.color, times = Hair), 
    levels = Hair.color)

  #----------

  # Compute summary statistics and perform the chi-square test 
  # for equal proportions of hair color

  summaryStats(Hair.fac, digits = 1, p.value = TRUE)
  #           N   Pct ChiSq_p
  #Black    108  18.2        
  #Brown    286  48.3        
  #Red       71  12.0        
  #Blond    127  21.5        
  #Combined 592 100.0 2.5e-39

  #----------
  # Now test the hypothesis that 10% of the population from which 
  # this sample was drawn has Red hair, and compute a 95% confidence 
  # interval for the percent of subjects with red hair.

  Red.Hair.fac <- factor(Hair.fac == "Red", levels = c(TRUE, FALSE), 
    labels = c("Red", "Not Red"))

  summaryStats(Red.Hair.fac, digits = 1, p.value = TRUE, 
    ci = TRUE, test = "binom", test.arg.list = list(p = 0.1))
  #           N Pct Exact_p 95%.LCL 95%.UCL
  #Red       71  12             9.5    14.9
  #Not Red  521  88                        
  #Combined 592 100    0.11

  #----------
  # Now test whether the percent of people with Green eyes is the 
  # same for people with and without Red hair.

  HairEye <- apply(HairEyeColor, 1:2, sum)
  Hair.color <- rownames(HairEye)
  Eye.color  <- colnames(HairEye)

  n11 <-     HairEye[Hair.color == "Red", Eye.color == "Green"]
  n12 <- sum(HairEye[Hair.color == "Red", Eye.color != "Green"])
  n21 <- sum(HairEye[Hair.color != "Red", Eye.color == "Green"])
  n22 <- sum(HairEye[Hair.color != "Red", Eye.color != "Green"])

  Hair.fac <- factor(rep(c("Red", "Not Red"), c(n11+n12, n21+n22)), 
    levels = c("Red", "Not Red"))
  Eye.fac  <- factor(c(rep("Green", n11), rep("Not Green", n12), 
    rep("Green", n21), rep("Not Green", n22)), 
    levels = c("Green", "Not Green"))


  #----------
  # Here are the results using the chi-square test and computing 
  # confidence limits for the difference between the two percentages

  summaryStats(Eye.fac, group = Hair.fac, digits = 1, 
    p.value = TRUE, ci = TRUE, test = "prop", 
    stats.in.rows = TRUE, test.arg.list = list(correct = FALSE))
  #                Green Not Green Combined
  #Red(N)           14    57        71     
  #Red(Pct)         19.7  80.3     100     
  #Not Red(N)       50   471       521     
  #Not Red(Pct)      9.6  90.4     100     
  #ChiSq_p                           0.01  
  #95%.LCL.between                   0.5   
  #95%.UCL.between                  19.7

  #----------
  # Here are the results using Fisher's exact test and computing 
  # confidence limits for the odds ratio

  summaryStats(Eye.fac, group = Hair.fac, digits = 1, 
    p.value = TRUE, ci = TRUE, test = "fisher", 
    stats.in.rows = TRUE)
  #             Green Not Green Combined
  #Red(N)        14    57        71     
  #Red(Pct)      19.7  80.3     100     
  #Not Red(N)    50   471       521     
  #Not Red(Pct)   9.6  90.4     100     
  #Fisher_p                       0.015 
  #95%.LCL.OR                     1.1   
  #95%.UCL.OR                     4.6 

  rm(Hair, Hair.color, Hair.fac, Red.Hair.fac, HairEye, Eye.color, 
    n11, n12, n21, n22, Eye.fac)

  #====================================================================

  # The data set EPA.89b.cadmium.df contains information on 
  # cadmium concentrations in groundwater collected from a
  # background and compliance well.  Compare detection frequencies 
  # between the well types and test for a difference using 
  # Fisher's exact test.

  summaryStats(factor(Censored) ~ Well.type, data = EPA.89b.cadmium.df, 
    digits = 1, p.value = TRUE, test = "fisher")


  summaryStats(factor(Censored) ~ Well.type, data = EPA.89b.cadmium.df, 
    digits = 1, p.value = TRUE, test = "fisher", stats.in.rows = TRUE)
  #                FALSE TRUE  Combined
  #Background(N)     8    16    24     
  #Background(Pct)  33.3  66.7 100     
  #Compliance(N)    24    40    64     
  #Compliance(Pct)  37.5  62.5 100     
  #Fisher_p                      0.81  
  #95%.LCL.OR                    0.3   
  #95%.UCL.OR                    2.5

  #====================================================================

  #--------------------
  # Paired Observations
  #--------------------

  # The data frame ACE.13.TCE.df contians paired observations of 
  # trichloroethylene (TCE; mg/L) at 10 groundwater monitoring wells 
  # before and after remediation.
  #
  # Compare TCE concentrations before and after remediation and 
  # use a paired t-test to test for a difference between periods.

  summaryStats(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    p.value = TRUE, paired = TRUE)


  summaryStats(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    p.value = TRUE, paired = TRUE, stats.in.rows = TRUE)
  #                       Before   After    Combined
  #N                       10       10       20     
  #Mean                    21.624    3.6329  12.6284
  #SD                      13.5113   3.5544  13.3281
  #Median                  20.3      2.48     8.475 
  #Min                      5.96     0.272    0.272 
  #Max                     41.5     10.7     41.5   
  #Diff                                     -17.9911
  #paired.p.value.between                     0.0027
  #95%.LCL.between                          -27.9097
  #95%.UCL.between                           -8.0725

  #==========

  # Repeat the last example, but use a one-sided alternative since 
  # remediation should decrease TCE concentration.

  summaryStats(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    p.value = TRUE, paired = TRUE, alternative = "less")


  summaryStats(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    p.value = TRUE, paired = TRUE, alternative = "less", 
    stats.in.rows = TRUE)
  #                            Before   After    Combined
  #N                            10       10       20     
  #Mean                         21.624    3.6329  12.6284
  #SD                           13.5113   3.5544  13.3281
  #Median                       20.3      2.48     8.475 
  #Min                           5.96     0.272    0.272 
  #Max                          41.5     10.7     41.5   
  #Diff                                          -17.9911
  #paired.p.value.between.less                     0.0013
  #95%.LCL.between                                   -Inf
  #95%.UCL.between                                -9.9537



