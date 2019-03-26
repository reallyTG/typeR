library(party)


### Name: Panel Generating Functions
### Title: Panel-Generators for Visualization of Party Trees
### Aliases: node_inner node_terminal edge_simple node_surv node_barplot
###   node_boxplot node_hist node_density node_scatterplot node_bivplot
### Keywords: hplot

### ** Examples


  set.seed(290875)

  airq <- subset(airquality, !is.na(Ozone))
  airct <- ctree(Ozone ~ ., data = airq)

  ## default: boxplots
  plot(airct)
  
  ## change colors
  plot(airct, tp_args = list(col = "blue", fill = hsv(2/3, 0.5, 1)))
  ## equivalent to
  plot(airct, terminal_panel = node_boxplot(airct, col = "blue", 
                                            fill = hsv(2/3, 0.5, 1)))

  ### very simple; the mean is given in each terminal node
  plot(airct, type = "simple")

  ### density estimates
  plot(airct, terminal_panel = node_density)
    
  ### histograms 
  plot(airct, terminal_panel = node_hist(airct, ymax = 0.06, 
                                         xscale = c(0, 250)))



