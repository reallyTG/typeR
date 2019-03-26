library(EnvStats)


### Name: plot.gof
### Title: Plot Results of Goodness-of-Fit Test
### Aliases: plot.gof
### Keywords: plot

### ** Examples

  # Create an object of class "gof" then plot the results.
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(250) 
  dat <- rnorm(20, mean = 3, sd = 2) 
  gof.obj <- gofTest(dat) 

  # Summary plot (the default)
  #---------------------------
  dev.new()
  plot(gof.obj)


  # Make your own titles for the summary plot
  #------------------------------------------
  dev.new()
  plot(gof.obj, captions = list(PDFs = "Compare PDFs", 
    CDFs = "Compare CDFs", QQ = "Q-Q Plot", Results = "Results"),
    om.title = "Summary")


  # Just the Q-Q Plot
  #------------------
  dev.new()
  plot(gof.obj, plot.type="Q-Q")


  # Make your own title for the Q-Q Plot
  #-------------------------------------
  dev.new()
  plot(gof.obj, plot.type="Q-Q", main = "Q-Q Plot")

  #==========

  # Clean up
  #---------
  rm(dat, gof.obj)
  graphics.off()



