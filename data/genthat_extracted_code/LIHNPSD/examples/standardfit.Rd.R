library(LIHNPSD)


### Name: standardfit
### Title: Standard utility to perform nonlinear PSD fit
### Aliases: standardfit

### ** Examples

  # Load the daily log-return data of DJIA 
  data(szd_logr)

  # Prepare the input data set
  merge_tails <- c(1,3)
  dt <- LIHNPSD_prepare_data(szd_logr, breaks=68, merge_tails=merge_tails)

  # Prepare the input PSD 
  dist <- list( sigma= 0.0036, alpha= 0.9, gamma= 0.0, beta= -0.014 )
  class(dist) <- "LIHNPSD"
  dist <- rawmean(dist)
  dist$location <- 0.00014

  # Invoke the nonlinear fit (This will take some time!)
  #fit <- standardfit(dist, dt$logr, dt$h, trace=1, iter=10,
  #       plotqq=1, weights=list(m3=5,m4=1,qq_df=4), merge_tails=merge_tails )
  
  # The final PSD
  #dist <- fit$dist



