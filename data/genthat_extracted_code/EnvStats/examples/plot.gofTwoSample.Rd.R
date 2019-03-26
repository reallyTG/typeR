library(EnvStats)


### Name: plot.gofTwoSample
### Title: Plot Results of Goodness-of-Fit Test to Compare Two Samples
### Aliases: plot.gofTwoSample
### Keywords: plot

### ** Examples

  # Create an object of class "gofTwoSample" then plot the results.
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(300) 
  dat1 <- rnorm(20, mean = 3, sd = 2) 
  dat2 <- rnorm(10, mean = 1, sd = 2) 
  gof.obj <- gofTest(x = dat1, y = dat2) 

  # Summary plot (the default)
  #---------------------------
  dev.new()
  plot(gof.obj)


  # Make your own titles for the summary plot
  #------------------------------------------
  dev.new()
  plot(gof.obj, captions = list(PDFs = "Compare PDFs", 
    CDFs = "Compare CDFs", QQ = "Q-Q Plot", Results = "Results"),
    om.title = "Summary Plot")


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
  rm(dat1, dat2, gof.obj)
  graphics.off()



