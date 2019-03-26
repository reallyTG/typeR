library(LIHNPSD)


### Name: MergeTailHistogram
### Title: Utility function to merge tails in the histogram
### Aliases: MergeTailHistogram
### Keywords: histogram tail

### ** Examples

  # Load the daily log-return data of DJIA 
  data(dji_logr)
  h <- hist(dji_logr, breaks = 60, plot = FALSE)
  # Merge two data points from the left tail, and one data points from the right tail
  q2 <- MergeTailHistogram( list(qhx=h$mids, qhy=h$counts), c(2,1) )



