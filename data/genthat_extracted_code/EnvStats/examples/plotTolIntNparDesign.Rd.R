library(EnvStats)


### Name: plotTolIntNparDesign
### Title: Plots for a Sampling Design Based on a Nonparametric Tolerance
###   Interval
### Aliases: plotTolIntNparDesign
### Keywords: distribution design htest

### ** Examples

  # Look at the relationship between confidence level and sample size for a two-sided 
  # nonparametric tolerance interval.

  dev.new()
  plotTolIntNparDesign()

  #==========

  # Plot confidence level vs. sample size for various values of coverage:

  dev.new()
  plotTolIntNparDesign(coverage = 0.7, ylim = c(0,1), main = "") 

  plotTolIntNparDesign(coverage = 0.8, add = TRUE, plot.col = "red") 

  plotTolIntNparDesign(coverage = 0.9, add = TRUE, plot.col = "blue") 

  legend("bottomright", c("coverage = 70%", "coverage = 80%", "coverage = 90%"), lty=1, 
    lwd = 3 * par("cex"), col = c("black", "red", "blue"), bty = "n") 

  title(main = paste("Confidence Level vs. Sample Size for Nonparametric TI", 
    "with Various Levels of Coverage", sep = "\n"))

  #==========

  # Example 17-4 on page 17-21 of USEPA (2009) uses copper concentrations (ppb) from 3 
  # background wells to set an upper limit for 2 compliance wells.  There are 6 observations 
  # per well, and the maximum value from the 3 wells is set to the 95% confidence upper 
  # tolerance limit, and we need to determine the coverage of this tolerance interval.  

  tolIntNparCoverage(n = 24, conf.level = 0.95, ti.type = "upper")
  #[1] 0.8826538

  # Here we will modify the example and look at confidence level versus coverage for 
  # a set sample size of n = 24.

  dev.new()
  plotTolIntNparDesign(x.var = "coverage", y.var = "conf.level", n = 24, ti.type = "upper")

  #==========

  # Clean up
  #---------
  graphics.off()



