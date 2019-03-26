library(EnvStats)


### Name: stat_test_text
### Title: Add Text to a ggplot2 Plot Indicating the Results of a
###   Hypothesis Test
### Aliases: stat_test_text
### Keywords: aplot

### ** Examples


  # First, load and attach the ggplot2 package.
  #--------------------------------------------

  library(ggplot2)

  #==========

  # Example 1:

  # Using the built-in data frame mtcars, 
  # plot miles per gallon vs. number of cylinders
  # using different colors for each level of the number of cylinders.
  #------------------------------------------------------------------

  p <- ggplot(mtcars, aes(x = factor(cyl), y = mpg, color = factor(cyl))) + 
    theme(legend.position = "none")

  p + geom_point(show.legend = FALSE) + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")


  # Now add text indicating the sample size and 
  # mean and standard deviation for each level of cylinder, and 
  # test for the difference in means between groups.
  #------------------------------------------------------------

  dev.new()
  p + geom_point() + 
    stat_n_text() + stat_mean_sd_text() + 
    stat_test_text() + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
  
  #==========

  # Example 2:

  # Repeat Example 1, but show text indicating the median and IQR, 
  # and use the nonparametric test.
  #---------------------------------------------------------------

  dev.new()
  p + geom_point() + 
    stat_n_text() + stat_median_iqr_text() + 
    stat_test_text(test = "nonparametric") + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
 
  #==========

  # Example 3:

  # Repeat Example 1, but use only the groups with 
  # 4 and 8 cylinders.
  #-----------------------------------------------

  p <- ggplot(subset(mtcars, cyl %in% c(4, 8)), 
    aes(x = factor(cyl), y = mpg, color = cyl)) + 
    theme(legend.position = "none")

  dev.new()
  p + geom_point() + 
    stat_n_text() + stat_mean_sd_text() + 
    stat_test_text() + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")

  #==========

  # Example 4:

  # Repeat Example 3, but 
  # 1) facet by transmission type,
  # 2) make the text smaller,
  # 3) put the text for the test results in a text box
  #    and make them blue.
  #---------------------------------------------------

  dev.new()
  p + geom_point() + 
    stat_n_text(size = 3) + stat_mean_sd_text(size = 3) + 
    stat_test_text(size = 3, text.box = TRUE, color = "blue") +
    facet_wrap(~ am, labeller = label_both) +  
    labs(x = "Number of Cylinders", y = "Miles per Gallon")

  #==========

  # Clean up
  #---------

  graphics.off()
  rm(p)



