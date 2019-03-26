library(EnvStats)


### Name: plot.gofCensored
### Title: Plot Results of Goodness-of-Fit Test Based on Censored Data
### Aliases: plot.gofCensored
### Keywords: plot

### ** Examples

  # Create an object of class "gofCensored", then plot the results. 
  #----------------------------------------------------------------

  gofCensored.obj <- with(EPA.09.Ex.15.1.manganese.df,
    gofTestCensored(Manganese.ppb, Censored, test = "sf"))

  mode(gofCensored.obj) 
  #[1] "list" 

  class(gofCensored.obj) 
  #[1] "gofCensored" 

  # Summary plot (the default)
  #---------------------------
  dev.new()
  plot(gofCensored.obj)


  # Make your own titles for the summary plot
  #------------------------------------------
  dev.new()
  plot(gofCensored.obj, captions = list(CDFs = "Compare CDFs", 
    QQ = "Q-Q Plot", Results = "Results"), om.title = "Summary")


  # Just the Q-Q Plot
  #------------------
  dev.new()
  plot(gofCensored.obj, plot.type="Q-Q")


  # Make your own title for the Q-Q Plot
  #-------------------------------------
  dev.new()
  plot(gofCensored.obj, plot.type="Q-Q", main = "Q-Q Plot")

  #==========

  # Clean up
  #---------
  rm(gofCensored.obj)
  graphics.off()



