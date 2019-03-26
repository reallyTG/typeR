library(EnvStats)


### Name: stat_median_iqr_text
### Title: Add Text Indicating the Median and Interquartile Range to a
###   ggplot2 Plot
### Aliases: stat_median_iqr_text
### Keywords: aplot

### ** Examples


  # First, load and attach the ggplot2 package.
  #--------------------------------------------

  library(ggplot2)

  #====================

  # Example 1:

  # Using the built-in data frame mtcars, 
  # plot miles per gallon vs. number of cylinders
  # using different colors for each level of the number of cylinders.
  #------------------------------------------------------------------

  p <- ggplot(mtcars, aes(x = factor(cyl), y = mpg, color = factor(cyl))) + 
    theme(legend.position = "none")

  p + geom_point() + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")


  # Now add text indicating the median and interquartile range 
  # for each level of cylinder.
  #-----------------------------------------------------------

  dev.new()
  p + geom_point() + 
    stat_median_iqr_text() + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
  
  #====================

  # Example 2:

  # Repeat Example 1, but:
  # 1) facet by transmission type, 
  # 2) make the size of the text smaller.
  #--------------------------------------

  dev.new()
  p + geom_point() + 
    stat_median_iqr_text(size = 2.75) + 
    facet_wrap(~ am, labeller = label_both) +  
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
 
  #====================

  # Example 3:

  # Repeat Example 1, but specify the y-position for the text.
  #-----------------------------------------------------------

  dev.new()
  p + geom_point() + 
    stat_median_iqr_text(y.pos = 36) + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")


  #====================

  # Example 4:

  # Repeat Example 1, but show the 
  # median and interquartile range in a text box.
  #----------------------------------------------

  dev.new()
  p + geom_point() + 
    stat_median_iqr_text(text.box = TRUE) + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
  
  #====================

  # Example 5:

  # Repeat Example 1, but use the color brown for the text.
  #--------------------------------------------------------
 
  dev.new()
  p + geom_point() + 
    stat_median_iqr_text(color = "brown") + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")

  #====================

  # Example 6:

  # Repeat Example 1, but:
  # 1) use the same colors for the text that are used for each group, 
  # 2) use the bold monospaced font.
  #------------------------------------------------------------------
 
  mat <- ggplot_build(p)$data[[1]]
  group <- mat[, "group"]
  colors <- mat[match(1:max(group), group), "colour"]

  dev.new()
  p + geom_point() + 
    stat_median_iqr_text(color = colors,  
      family = "mono", fontface = "bold") + 
    labs(x = "Number of Cylinders", y = "Miles per Gallon")
 
  #====================

  # Clean up
  #---------

  graphics.off()
  rm(p, mat, group, colors)



