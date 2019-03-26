library(EnvStats)


### Name: stripChart
### Title: 1-D Scatter Plots with Confidence Intervals
### Aliases: stripChart stripChart.default stripChart.formula
### Keywords: hplot htest

### ** Examples

  #------------------------
  # Two Independent Samples
  #------------------------

  # The guidance document USEPA (1994b, pp. 6.22--6.25) 
  # contains measures of 1,2,3,4-Tetrachlorobenzene (TcCB) 
  # concentrations (in parts per billion) from soil samples 
  # at a Reference area and a Cleanup area.  These data are strored 
  # in the data frame EPA.94b.tccb.df.  
  #
  # First create one-dimensional scatterplots to compare the 
  # TcCB concentrations between the areas and use a nonparametric 
  # test to test for a difference between areas.

  dev.new()
  stripChart(TcCB ~ Area, data = EPA.94b.tccb.df, col = c("red", "blue"), 
    p.value = TRUE, ci.and.test = "nonparametric", 
    ylab = "TcCB (ppb)")

  #----------

  # Now log-transform the TcCB data and use a parametric test
  # to compare the areas.

  dev.new()
  stripChart(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, col = c("red", "blue"), 
    p.value = TRUE, ylab = "log10 [ TcCB (ppb) ]")

  #----------

  # Repeat the above procedure, but also plot the confidence interval  
  # for the difference between the means.

  dev.new()
  stripChart(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, col = c("red", "blue"), 
    p.value = TRUE, plot.diff = TRUE, diff.col = "black", 
    ylab = "log10 [ TcCB (ppb) ]")

  #----------

  # Repeat the above procedure, but allow the variances to differ.

  dev.new()
  stripChart(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, col = c("red", "blue"),
    p.value = TRUE, plot.diff = TRUE, diff.col = "black", 
    ylab = "log10 [ TcCB (ppb) ]", test.arg.list = list(var.equal = FALSE))

  #----------

  # Repeat the above procedure, but jitter the points instead of 
  # stacking them.

  dev.new()
  stripChart(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, col = c("red", "blue"),
    p.value = TRUE, plot.diff = TRUE, diff.col = "black", 
    ylab = "log10 [ TcCB (ppb) ]", test.arg.list = list(var.equal = FALSE), 
    method = "jitter", ci.offset = 4)

  #---------- 

  # Clean up
  #---------
  graphics.off()

  #====================

  #--------------------
  # Paired Observations
  #--------------------

  # The data frame ACE.13.TCE.df contians paired observations of 
  # trichloroethylene (TCE; mg/L) at 10 groundwater monitoring wells 
  # before and after remediation.
  #
  # Create one-dimensional scatterplots to compare TCE concentrations 
  # before and after remediation and use a paired t-test to 
  # test for a difference between periods.

  ACE.13.TCE.df
  #   TCE.mg.per.L Well Period
  #1        20.900    1 Before
  #2         9.170    2 Before
  #3         5.960    3 Before
  #...      ......   .. ......
  #18        0.520    8  After
  #19        3.060    9  After
  #20        1.900   10  After

  dev.new()
  stripChart(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    col = c("brown", "green"), p.value = TRUE, paired = TRUE, 
    ylab = "TCE (mg/L)")

  #----------

  # Repeat the above procedure, but also plot the confidence interval  
  # for the mean of the paired differences.

  dev.new()
  stripChart(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    col = c("brown", "green"), p.value = TRUE, paired = TRUE, 
    ylab = "TCE (mg/L)", plot.diff = TRUE, diff.col = "blue")


  #==========

  # Repeat the last two examples, but use a one-sided alternative since 
  # remediation should decrease TCE concentration.

  dev.new()
  stripChart(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    col = c("brown", "green"), p.value = TRUE, paired = TRUE, 
    ylab = "TCE (mg/L)", alternative = "less", 
    group.difference.digits = 2)

  #----------

  # Repeat the above procedure, but also plot the confidence interval  
  # for the mean of the paired differences.
  #
  # NOTE: Although stripChart can *report* one-sided confidence intervals 
  #       for the difference between two groups (see above example), 
  #       when *plotting* the confidence interval for the difference, 
  #       only two-sided CIs are allowed.  
  #       Here, we will set the confidence level of the confidence 
  #       interval for the mean of the paired differences to 90%, 
  #       so that the upper bound of the CI corresponds to the upper 
  #       bound of a 95% one-sided CI.

  dev.new()
  stripChart(TCE.mg.per.L ~ Period, data = ACE.13.TCE.df, 
    col = c("brown", "green"), p.value = TRUE, paired = TRUE, 
    ylab = "TCE (mg/L)", group.difference.digits = 2, 
    plot.diff = TRUE, diff.col = "blue", group.difference.conf.level = 0.9)

 #---------- 

  # Clean up
  #---------
  graphics.off()

  #==========

  # The data frame Helsel.Hirsch.02.Mayfly.df contains paired counts
  # of mayfly nymphs above and below industrial outfalls in 12 streams.  
  #
  # Create one-dimensional scatterplots to compare the 
  # counts between locations and use a nonparametric test 
  # to compare counts above and below the outfalls.

  Helsel.Hirsch.02.Mayfly.df
  #   Mayfly.Count Stream Location
  #1            12      1    Above
  #2            15      2    Above
  #3            11      3    Above
  #...         ...     ..    .....
  #22           60     10    Below
  #23           53     11    Below
  #24          124     12    Below

  dev.new()
  stripChart(Mayfly.Count ~ Location, data = Helsel.Hirsch.02.Mayfly.df, 
    col = c("green", "brown"), p.value = TRUE, paired = TRUE, 
    ci.and.test = "nonparametric", ylab = "Number of Mayfly Nymphs")

  #---------- 
 
  # Repeat the above procedure, but also plot the confidence interval  
  # for the pseudomedian of the paired differences.

  dev.new()
  stripChart(Mayfly.Count ~ Location, data = Helsel.Hirsch.02.Mayfly.df, 
    col = c("green", "brown"), p.value = TRUE, paired = TRUE, 
    ci.and.test = "nonparametric", ylab = "Number of Mayfly Nymphs", 
    plot.diff = TRUE, diff.col = "blue")

 #---------- 

  # Clean up
  #---------
  graphics.off()



