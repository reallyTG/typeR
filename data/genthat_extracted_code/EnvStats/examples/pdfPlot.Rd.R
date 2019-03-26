library(EnvStats)


### Name: pdfPlot
### Title: Plot Probability Density Function
### Aliases: pdfPlot 'Probability Density' 'Plot Probability Density' 'Plot
###   PDF'
### Keywords: distribution hplot

### ** Examples

  # Plot the pdf of the standard normal distribution 
  #-------------------------------------------------
  dev.new()
  pdfPlot()

  #==========

  # Plot the pdf of the standard normal distribution
  # and a N(2, 2) distribution on the sample plot. 
  #-------------------------------------------------
  dev.new()
  pdfPlot(param.list = list(mean=2, sd=2), 
    curve.fill = FALSE, ylim = c(0, dnorm(0)), main = "") 

  pdfPlot(add = TRUE, pdf.col = "red") 

  legend("topright", legend = c("N(2,2)", "N(0,1)"), 
    col = c("black", "red"), lwd = 3 * par("cex")) 

  title("PDF Plots for Two Normal Distributions")
 
  #==========

  # Clean up
  #---------
  graphics.off()



