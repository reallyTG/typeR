library(EnvStats)


### Name: geom_stripchart
### Title: 1-D Scatter Plots with Confidence Intervals Using ggplot2
### Aliases: geom_stripchart
### Keywords: hplot htest

### ** Examples


  # First, load and attach the ggplot2 package.
  #--------------------------------------------

  library(ggplot2)

  #==========

  #---------------------
  # 3 Independent Groups
  #---------------------

  # Example 1:

  # Using the built-in data frame mtcars, 
  # create a stipchart of miles per gallon vs. number of cylinders
  # using different colors for each level of the number of cylinders.
  #------------------------------------------------------------------

  p <- ggplot(mtcars, aes(x = factor(cyl), y = mpg, color = factor(cyl))) 

  p + geom_stripchart() + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")

  #==========

  # Example 2:

  # Repeat Example 1, but include the results of the 
  # standard parametric analysis of variance.
  #-------------------------------------------------

  dev.new()
  p + geom_stripchart(test.text = TRUE) + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
## Not run: 
##D   #==========
##D 
##D   # Example 3:
##D 
##D   # Using Example 2, show explicitly the layering 
##D   # process that geom_stripchart is using.
##D   #
##D   # This plot should look identical to the previous one.
##D   #-----------------------------------------------------
##D 
##D   set.seed(47)
##D   dev.new()
##D   p + theme(legend.position = "none") + 
##D     geom_jitter(pch = 1, width = 0.15, height = 0) + 
##D     stat_summary(fun.y = "mean", geom = "point", 
##D       size = 2, position = position_nudge(x = 0.3)) + 
##D     stat_summary(fun.data = "mean_cl_normal", geom = "errorbar", 
##D       size = 0.75, width = 0.075, position = position_nudge(x = 0.3)) + 
##D     stat_n_text() + 
##D     stat_mean_sd_text() + 
##D     stat_test_text() + 
##D     labs(x = "Number of Cylinders", y = "Miles per Gallon")
##D 
##D   #==========
##D 
##D   # Example 4:
##D 
##D   # Repeat Example 2, but put all text in a text box.
##D   #--------------------------------------------------
##D 
##D   dev.new()
##D   p + geom_stripchart(text.box = TRUE, test.text = TRUE) + 
##D     labs(x = "Number of Cylinders", y = "Miles per Gallon")
##D 
##D   #==========
##D 
##D   # Example 5:
##D 
##D   # Repeat Example 2, but put just the test results 
##D   # in a text box.
##D   #------------------------------------------------
##D 
##D   dev.new()
##D   p + geom_stripchart(test.text = TRUE, test.text.box = TRUE) + 
##D     labs(x = "Number of Cylinders", y = "Miles per Gallon")
##D 
##D   #==========
##D 
##D   # Example 6:
##D 
##D   # Repeat Example 2, but:
##D   # 1) plot the median and IQR instead of the mean and the 95##D 
##D   # 2) show text for the median and IQR, and 
##D   # 3) use the nonparametric test to compare groups.
##D   #
##D   # Note that following what the ggplot2 stat_summary function 
##D   # does when you specify a "confidence interval" for the 
##D   # median (i.e., when you call stat_summary with the arguments
##D   # geom="errorbar" and fun.data="median_hilow"), the displayed 
##D   # error bars show intervals based on estimated quuantiles.  
##D   # By default, stat_summary with the arguments
##D   # geom="errorbar" and fun.data="median_hilow" displays 
##D   # error bars using the 2.5'th and 97.5'th percentiles. 
##D   # The function geom_stripchart, however, by default 
##D   # displays error bars using the 25'th and 75'th percentiles 
##D   # (see the explanation for the argument ci above).
##D   #------------------------------------------------------------
##D 
##D   dev.new()
##D   p + geom_stripchart(location = "median", test.text = TRUE) + 
##D     labs(x = "Number of Cylinders", y = "Miles per Gallon")
##D 
##D   #==========
##D 
##D   # Clean up
##D   #---------
##D 
##D   graphics.off()
##D   rm(p)
##D 
##D   #========================================
##D 
##D   #---------------------
##D   # 2 Independent Groups
##D   #---------------------
##D 
##D   # Example 7:
##D 
##D   # Repeat Example 2, but use only the groups with 
##D   # 4 and 8 cylinders.
##D   #-----------------------------------------------
##D 
##D   dev.new()
##D   p <- ggplot(subset(mtcars, cyl %in% c(4, 8)), 
##D     aes(x = factor(cyl), y = mpg, color = cyl))
##D 
##D   p + geom_stripchart(test.text = TRUE) + 
##D     labs(x = "Number of Cylinders", y = "Miles per Gallon")
##D 
##D   #==========
##D 
##D   # Example 8:
##D 
##D   # Repeat Example 7, but 
##D   # 1) facet by transmission type 
##D   # 2) make the text smaller
##D   # 3) put the text for the test results in a text box
##D   #    and make them blue.
##D 
##D   dev.new()
##D   p + geom_stripchart(test.text = TRUE, test.text.box = TRUE, 
##D         n.text.params = list(size = 3), 
##D         location.scale.text.params = list(size = 3), 
##D         test.text.params = list(size = 3, color = "blue")) + 
##D     facet_wrap(~ am, labeller = label_both) +  
##D     labs(x = "Number of Cylinders", y = "Miles per Gallon")
##D 
##D   #==========
##D 
##D   # Clean up
##D   #---------
##D 
##D   graphics.off()
##D   rm(p)
##D 
##D   #========================================
##D 
##D   #---------------------
##D   # 2 Independent Groups
##D   #---------------------
##D 
##D   # Example 9:
##D 
##D   # The guidance document USEPA (1994b, pp. 6.22--6.25) 
##D   # contains measures of 1,2,3,4-Tetrachlorobenzene (TcCB) 
##D   # concentrations (in parts per billion) from soil samples 
##D   # at a Reference area and a Cleanup area.  These data are strored 
##D   # in the data frame EPA.94b.tccb.df.  
##D   #
##D   # First create one-dimensional scatterplots to compare the 
##D   # TcCB concentrations between the areas and use a nonparametric 
##D   # test to test for a difference between areas.
##D 
##D   dev.new()
##D   p <- ggplot(EPA.94b.tccb.df, aes(x = Area, y = TcCB, color = Area))
##D 
##D   p + geom_stripchart(location = "median", test.text = TRUE) + 
##D     labs(y = "TcCB (ppb)")
##D 
##D   #==========
##D 
##D   # Example 10:
##D 
##D   # Now log-transform the TcCB data and use a parametric test
##D   # to compare the areas.
##D 
##D   dev.new()
##D   p <- ggplot(EPA.94b.tccb.df, aes(x = Area, y = log10(TcCB), color = Area))
##D 
##D   p + geom_stripchart(test.text = TRUE) + 
##D     labs(y = "log10[ TcCB (ppb) ]")
##D 
##D   #==========
##D 
##D   # Example 11:
##D 
##D   # Repeat Example 10, but allow the variances to differ
##D   # between Areas.
##D   #-----------------------------------------------------
##D 
##D   dev.new()
##D   p + geom_stripchart(test.text = TRUE, 
##D         test.text.params = list(test.arg.list = list(var.equal=FALSE))) + 
##D     labs(y = "log10[ TcCB (ppb) ]")
##D 
##D   #==========
##D 
##D   # Clean up
##D   #---------
##D 
##D   graphics.off()
##D   rm(p)
##D 
##D   #========================================
##D 
##D   #--------------------
##D   # Paired Observations
##D   #--------------------
##D 
##D   # Example 12:
##D 
##D   # The data frame ACE.13.TCE.df contians paired observations of 
##D   # trichloroethylene (TCE; mg/L) at 10 groundwater monitoring wells 
##D   # before and after remediation.
##D   #
##D   # Create one-dimensional scatterplots to compare TCE concentrations 
##D   # before and after remediation and use a paired t-test to 
##D   # test for a difference between periods.
##D 
##D   ACE.13.TCE.df
##D   #   TCE.mg.per.L Well Period
##D   #1        20.900    1 Before
##D   #2         9.170    2 Before
##D   #3         5.960    3 Before
##D   #...      ......   .. ......
##D   #18        0.520    8  After
##D   #19        3.060    9  After
##D   #20        1.900   10  After
##D 
##D   dev.new()
##D   p <- ggplot(ACE.13.TCE.df, aes(x = Period, y = TCE.mg.per.L, color = Period))
##D 
##D   p + geom_stripchart(paired = TRUE, group = "Well", test.text = TRUE) + 
##D     labs(y = "TCE (mg/L)")
##D 
##D   #==========
##D 
##D   # Example 13:
##D 
##D   # Repeat Example 11, but use a one-sided alternative since 
##D   # remediation should decrease TCE concentration.
##D   #---------------------------------------------------------
##D 
##D   dev.new()
##D   p + geom_stripchart(paired = TRUE, group = "Well", test.text = TRUE, 
##D     test.text.params = list(test.arg.list = list(alternative="less"))) + 
##D     labs(y = "TCE (mg/L)")
##D 
##D   #==========
##D 
##D   # Clean up
##D   #---------
##D 
##D   graphics.off()
##D   rm(p)
##D 
##D   #========================================
##D 
##D   #----------------------------------------
##D   # Paired Observations, Nonparametric Test
##D   #----------------------------------------
##D 
##D   # Example 14:
##D 
##D   # The data frame Helsel.Hirsch.02.Mayfly.df contains paired counts
##D   # of mayfly nymphs above and below industrial outfalls in 12 streams.  
##D   #
##D   # Create one-dimensional scatterplots to compare the 
##D   # counts between locations and use a nonparametric test 
##D   # to compare counts above and below the outfalls.
##D 
##D   Helsel.Hirsch.02.Mayfly.df
##D   #   Mayfly.Count Stream Location
##D   #1            12      1    Above
##D   #2            15      2    Above
##D   #3            11      3    Above
##D   #...         ...     ..    .....
##D   #22           60     10    Below
##D   #23           53     11    Below
##D   #24          124     12    Below
##D 
##D   dev.new()
##D   p <- ggplot(Helsel.Hirsch.02.Mayfly.df, 
##D     aes(x = Location, y = Mayfly.Count, color = Location))
##D 
##D   p + geom_stripchart(location = "median", paired = TRUE, 
##D       group = "Stream", test.text = TRUE) + 
##D     labs(y = "Number of Mayfly Nymphs")
##D 
##D   #==========
##D 
##D   # Clean up
##D   #---------
##D 
##D   graphics.off()
##D   rm(p)
##D   
## End(Not run)



