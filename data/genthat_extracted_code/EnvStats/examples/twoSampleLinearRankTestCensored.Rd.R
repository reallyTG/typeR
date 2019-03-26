library(EnvStats)


### Name: twoSampleLinearRankTestCensored
### Title: Two-Sample Linear Rank Test to Detect a Difference Between Two
###   Distributions Based on Censored Data
### Aliases: twoSampleLinearRankTestCensored
### Keywords: htest nonparametric regression

### ** Examples

  # The last part of the EXAMPLES section in the help file for 
  # cdfCompareCensored compares the empirical distribution of copper and zinc 
  # between two sites:  Alluvial Fan and Basin-Trough (Millard and Deverel, 1988).  
  # The data for this example are stored in Millard.Deverel.88.df.  Perform a 
  # test to determine if there is a significant difference between these two 
  # sites (perform a separate test for the copper and the zinc).

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


  #------------------------------
  # First look at the copper data 
  #------------------------------

  Cu.AF <- with(Millard.Deverel.88.df, 
    Cu[Zone == "Alluvial.Fan"])

  Cu.AF.cen <- with(Millard.Deverel.88.df, 
    Cu.censored[Zone == "Alluvial.Fan"]) 

  Cu.BT <- with(Millard.Deverel.88.df, 
    Cu[Zone == "Basin.Trough"])

  Cu.BT.cen <- with(Millard.Deverel.88.df, 
    Cu.censored[Zone == "Basin.Trough"])

  # Note the large number of tied observations in the copper data
  #-------------------------------------------------------------- 

  table(Cu.AF[!Cu.AF.cen]) 
  # 1  2  3  4  5  7  8  9 10 11 12 16 20 
  # 5 21  6  3  3  3  1  1  1  1  1  1  1

  table(Cu.BT[!Cu.BT.cen]) 
  # 1  2  3  4  5  6  8  9 12 14 15 17 23 
  # 7  4  8  5  1  2  1  2  1  1  1  1  1


  # Logrank test with hypergeometric variance:
  #-------------------------------------------
  twoSampleLinearRankTestCensored(x = Cu.AF, x.censored = Cu.AF.cen, 
    y = Cu.BT, y.censored = Cu.BT.cen)

  #Results of Hypothesis Test
  #Based on Censored Data
  #--------------------------
  #
  #Null Hypothesis:                 Fy(t) = Fx(t)
  #
  #Alternative Hypothesis:          Fy(t) != Fx(t) for at least one t
  #
  #Test Name:                       Two-Sample Linear Rank Test:
  #                                 Logrank Test
  #                                 with Hypergeometric Variance
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              x =  1  5 10 20 
  #                                 y =  1  2  5 10 15 
  #
  #Data:                            x = Cu.AF
  #                                 y = Cu.BT
  #
  #Censoring Variable:              x = Cu.AF.cen
  #                                 y = Cu.BT.cen
  #
  #Number NA/NaN/Inf's Removed:     x = 3
  #                                 y = 1
  #
  #Sample Sizes:                    nx = 65
  #                                 ny = 49
  #
  #Percent Censored:                x = 26.2%
  #                                 y = 28.6%
  #
  #Test Statistics:                 nu     = -1.8791355
  #                                 var.nu = 13.6533490
  #                                 z      = -0.5085557
  #
  #P-value:                         0.6110637


  # Compare the p-values produced by the Normal Scores 2 test
  # using the hypergeomtric vs. permutation variance estimates.
  # Note how much larger the estimated variance is based on
  # the permuation variance estimate:
  #-----------------------------------------------------------

  twoSampleLinearRankTestCensored(x = Cu.AF, x.censored = Cu.AF.cen, 
    y = Cu.BT, y.censored = Cu.BT.cen, 
    test = "normal.scores.2")$p.value
  #[1] 0.2008913

  twoSampleLinearRankTestCensored(x = Cu.AF, x.censored = Cu.AF.cen, 
    y = Cu.BT, y.censored = Cu.BT.cen, 
    test = "normal.scores.2", variance = "permutation")$p.value
  #[1] [1] 0.657001


  #--------------------------
  # Now look at the zinc data
  #--------------------------

  Zn.AF <- with(Millard.Deverel.88.df, 
    Zn[Zone == "Alluvial.Fan"])

  Zn.AF.cen <- with(Millard.Deverel.88.df, 
    Zn.censored[Zone == "Alluvial.Fan"])

  Zn.BT <- with(Millard.Deverel.88.df, 
    Zn[Zone == "Basin.Trough"])

  Zn.BT.cen <- with(Millard.Deverel.88.df, 
    Zn.censored[Zone == "Basin.Trough"])

  # Note the moderate number of tied observations in the zinc data, 
  # and the "outlier" of 620 in the Alluvial Fan data.
  #--------------------------------------------------------------- 

  table(Zn.AF[!Zn.AF.cen]) 
  #  5   7   8   9  10  11  12  17  18  19  20  23  29  30  33  40  50 620 
  #  1   1   1   1  20   2   1   1   1   1  14   1   1   1   1   1   1   1 

  table(Zn.BT[!Zn.BT.cen]) 
  # 3  4  5  6  8 10 11 12 13 14 15 17 20 25 30 40 50 60 70 90 
  # 2  2  2  1  1  5  1  2  1  1  1  2 11  1  4  3  2  2  1  1


  # Logrank test with hypergeometric variance:
  #-------------------------------------------
  twoSampleLinearRankTestCensored(x = Zn.AF, x.censored = Zn.AF.cen, 
    y = Zn.BT, y.censored = Zn.BT.cen)

  #Results of Hypothesis Test
  #Based on Censored Data
  #--------------------------
  #
  #Null Hypothesis:                 Fy(t) = Fx(t)
  #
  #Alternative Hypothesis:          Fy(t) != Fx(t) for at least one t
  #
  #Test Name:                       Two-Sample Linear Rank Test:
  #                                 Logrank Test
  #                                 with Hypergeometric Variance
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              x =  3 10 
  #                                 y =  3 10 
  #
  #Data:                            x = Zn.AF
  #                                 y = Zn.BT
  #
  #Censoring Variable:              x = Zn.AF.cen
  #                                 y = Zn.BT.cen
  #
  #Number NA/NaN/Inf's Removed:     x = 1
  #                                 y = 0
  #
  #Sample Sizes:                    nx = 67
  #                                 ny = 50
  #
  #Percent Censored:                x = 23.9%
  #                                 y =  8.0%
  #
  #Test Statistics:                 nu     = -6.992999
  #                                 var.nu = 17.203227
  #                                 z      = -1.686004
  #
  #P-value:                         0.09179512

  #----------

  # Compare the p-values produced by the Logrank, Gehan, Peto-Peto, 
  # and Tarone-Ware tests using the hypergeometric variance.
  #-----------------------------------------------------------

  twoSampleLinearRankTestCensored(x = Zn.AF, x.censored = Zn.AF.cen, 
    y = Zn.BT, y.censored = Zn.BT.cen, 
    test = "logrank")$p.value
  #[1] 0.09179512

  twoSampleLinearRankTestCensored(x = Zn.AF, x.censored = Zn.AF.cen, 
    y = Zn.BT, y.censored = Zn.BT.cen, 
    test = "gehan")$p.value
  #[1] 0.0185445

  twoSampleLinearRankTestCensored(x = Zn.AF, x.censored = Zn.AF.cen, 
    y = Zn.BT, y.censored = Zn.BT.cen, 
    test = "peto-peto")$p.value
  #[1] 0.009704529

  twoSampleLinearRankTestCensored(x = Zn.AF, x.censored = Zn.AF.cen, 
    y = Zn.BT, y.censored = Zn.BT.cen, 
    test = "tarone-ware")$p.value
  #[1] 0.03457803

  #----------

  # Clean up
  #---------

  rm(Cu.AF, Cu.AF.cen, Cu.BT, Cu.BT.cen, 
     Zn.AF, Zn.AF.cen, Zn.BT, Zn.BT.cen)


  #==========

  # Example 16.5 on pages 16-22 to 16.23 of USEPA (2009) shows how to perform 
  # the Tarone-Ware two sample linear rank test based on censored data using 
  # observations on tetrachloroethylene (PCE) (ppb) collected at one background 
  # and one compliance well.  The data for this example are stored in 
  # EPA.09.Ex.16.5.PCE.df.

  EPA.09.Ex.16.5.PCE.df

  #    Well.type PCE.Orig.ppb PCE.ppb Censored
  #1  Background           <4     4.0     TRUE
  #2  Background          1.5     1.5    FALSE
  #3  Background           <2     2.0     TRUE
  #4  Background          8.7     8.7    FALSE
  #5  Background          5.1     5.1    FALSE
  #6  Background           <5     5.0     TRUE
  #7  Compliance          6.4     6.4    FALSE
  #8  Compliance         10.9    10.9    FALSE
  #9  Compliance            7     7.0    FALSE
  #10 Compliance         14.3    14.3    FALSE
  #11 Compliance          1.9     1.9    FALSE
  #12 Compliance           10    10.0    FALSE
  #13 Compliance          6.8     6.8    FALSE
  #14 Compliance           <5     5.0     TRUE

  with(EPA.09.Ex.16.5.PCE.df, 
    twoSampleLinearRankTestCensored(
      x = PCE.ppb[Well.type == "Compliance"], 
      x.censored = Censored[Well.type == "Compliance"], 
      y = PCE.ppb[Well.type == "Background"], 
      y.censored = Censored[Well.type == "Background"], 
      test = "tarone-ware", alternative = "greater"))

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
  #Censoring Level(s):              x = 5 
  #                                 y = 2 4 5 
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

  # Compare the p-value for the Tarone-Ware test with p-values from 
  # the logrank, Gehan, and Peto-Peto tests
  #-----------------------------------------------------------------

  with(EPA.09.Ex.16.5.PCE.df, 
    twoSampleLinearRankTestCensored(
      x = PCE.ppb[Well.type == "Compliance"], 
      x.censored = Censored[Well.type == "Compliance"], 
      y = PCE.ppb[Well.type == "Background"], 
      y.censored = Censored[Well.type == "Background"], 
      test = "tarone-ware", alternative = "greater"))$p.value
  #[1] 0.03217495


  with(EPA.09.Ex.16.5.PCE.df, 
    twoSampleLinearRankTestCensored(
      x = PCE.ppb[Well.type == "Compliance"], 
      x.censored = Censored[Well.type == "Compliance"], 
      y = PCE.ppb[Well.type == "Background"], 
      y.censored = Censored[Well.type == "Background"], 
      test = "logrank", alternative = "greater"))$p.value
  #[1] 0.02752793


  with(EPA.09.Ex.16.5.PCE.df, 
    twoSampleLinearRankTestCensored(
      x = PCE.ppb[Well.type == "Compliance"], 
      x.censored = Censored[Well.type == "Compliance"], 
      y = PCE.ppb[Well.type == "Background"], 
      y.censored = Censored[Well.type == "Background"], 
      test = "gehan", alternative = "greater"))$p.value
  #[1] 0.03656224

  with(EPA.09.Ex.16.5.PCE.df, 
    twoSampleLinearRankTestCensored(
      x = PCE.ppb[Well.type == "Compliance"], 
      x.censored = Censored[Well.type == "Compliance"], 
      y = PCE.ppb[Well.type == "Background"], 
      y.censored = Censored[Well.type == "Background"], 
      test = "peto-peto", alternative = "greater"))$p.value
  #[1] 0.03127296

  #==========

  # The results shown in Table 9 of Millard and Deverel (1988, p.2097) are correct 
  # only for the hypergeometric variance and the modified MWW tests; the other 
  # results were computed as if there were no ties.  Re-compute the correct 
  # z-statistics and p-values for the copper and zinc data. 

  test <- c(rep(c("gehan", "logrank", "peto-peto"), 2), "peto-peto", 
    "normal.scores.1", "normal.scores.2", "normal.scores.2")

  variance <- c(rep("permutation", 3), rep("hypergeometric", 3), 
    "asymptotic", rep("permutation", 2), "hypergeometric")

  stats.mat <- matrix(as.numeric(NA), ncol = 4, nrow = 10)

  for(i in 1:10) {
    dum.list <- with(Millard.Deverel.88.df, 
        twoSampleLinearRankTestCensored(
          x = Cu[Zone == "Basin.Trough"], 
          x.censored = Cu.censored[Zone == "Basin.Trough"],
          y = Cu[Zone == "Alluvial.Fan"], 
          y.censored = Cu.censored[Zone == "Alluvial.Fan"], 
          test = test[i], variance = variance[i]))
    stats.mat[i, 1:2] <- c(dum.list$statistic["z"], dum.list$p.value)

    dum.list <- with(Millard.Deverel.88.df, 
        twoSampleLinearRankTestCensored(
          x = Zn[Zone == "Basin.Trough"], 
          x.censored = Zn.censored[Zone == "Basin.Trough"],
          y = Zn[Zone == "Alluvial.Fan"], 
          y.censored = Zn.censored[Zone == "Alluvial.Fan"], 
          test = test[i], variance = variance[i]))
    stats.mat[i, 3:4] <- c(dum.list$statistic["z"], dum.list$p.value)
  }

  dimnames(stats.mat) <- list(paste(test, variance, sep = "."), 
    c("Cu.Z", "Cu.p.value", "Zn.Z", "Zn.p.value"))

  round(stats.mat, 2)
  #                               Cu.Z Cu.p.value Zn.Z Zn.p.value
  #gehan.permutation              0.87       0.38 2.49       0.01
  #logrank.permutation            0.79       0.43 1.75       0.08
  #peto-peto.permutation          0.92       0.36 2.42       0.02
  #gehan.hypergeometric           0.71       0.48 2.35       0.02
  #logrank.hypergeometric         0.51       0.61 1.69       0.09
  #peto-peto.hypergeometric       1.03       0.30 2.59       0.01
  #peto-peto.asymptotic           0.90       0.37 2.37       0.02
  #normal.scores.1.permutation    0.94       0.34 2.37       0.02
  #normal.scores.2.permutation    0.98       0.33 2.39       0.02
  #normal.scores.2.hypergeometric 1.28       0.20 2.48       0.01

  #----------

  # Clean up
  #---------
  rm(test, variance, stats.mat, i, dum.list)



