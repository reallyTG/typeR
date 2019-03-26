library(LIHNPSD)


### Name: LIHNPSD-package
### Title: Poisson Subordinated Distribution
### Aliases: LIHNPSD-package LIHNPSD
### Keywords: package

### ** Examples

  # Load the daily log-return data of DJIA 
  data(dji_logr)
  
  # Construct the S3 object for PSD
  dist <- list( sigma= 0.004625, alpha= 0.292645, gamma= 0.482744, beta= -0.154049, location= 0.002968 )
  class(dist) <- "LIHNPSD"
  dist <- rawmean(dist)

  # A simple graph of the distribution's log PDF
  x <- seq(-0.1,0.1,by=0.1/1000)
  plot( x, log(rawdensity(dist,x)), pch=".")
  
  # The more sophisticated fit and graphs
  dt <- LIHNPSD_prepare_data(dji_logr, breaks=160, merge_tails=c(4,2))
  th <- LIHNPSD_theoretical_result(dist, dt)
  LIHNPSD_plot_std4gr(th, dt)



