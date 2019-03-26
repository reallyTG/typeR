library(EnvStats)


### Name: Empirical
### Title: The Empirical Distribution Based on a Set of Observations
### Aliases: Empirical demp pemp qemp remp
### Keywords: distribution datagen

### ** Examples

  # Create a set of 100 observations from a gamma distribution with 
  # parameters shape=4 and scale=5. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(3) 
  obs <- rgamma(100, shape=4, scale=5)

  # Now plot the empirical distribution (with a histogram) and the true distribution:

  dev.new()
  hist(obs, col = "cyan", xlim = c(0, 65), freq = FALSE, 
    ylab = "Relative Frequency") 

  pdfPlot('gamma', list(shape = 4, scale = 5), add = TRUE) 

  box()

  # Now plot the empirical distribution (based on demp) with the 
  # true distribution:

  x <- qemp(p = seq(0, 1, len = 100), obs = obs) 
  y <- demp(x, obs) 

  dev.new()
  plot(x, y, xlim = c(0, 65), type = "n", 
    xlab = "Value of Random Variable", 
    ylab = "Relative Frequency") 
  lines(x, y, lwd = 2, col = "cyan") 

  pdfPlot('gamma', list(shape = 4, scale = 5), add = TRUE)

  # Alternatively, you can create the above plot with the function 
  # epdfPlot:

  dev.new()
  epdfPlot(obs, xlim = c(0, 65), epdf.col = "cyan", 
    xlab = "Value of Random Variable", 
    main = "Empirical and Theoretical PDFs")

  pdfPlot('gamma', list(shape = 4, scale = 5), add = TRUE)

  


  # Clean Up
  #---------
  rm(obs, x, y)




