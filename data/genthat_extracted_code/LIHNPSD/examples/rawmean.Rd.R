library(LIHNPSD)


### Name: rawmean
### Title: Utility to construct a PSD S3 object with calculated mean
### Aliases: rawmean
### Keywords: constructor

### ** Examples

  # Construct the S3 object for PSD
  dist <- list( sigma= 0.004625, alpha= 0.292645, gamma= 0.482744, beta= -0.154049, location= 0.002968 )
  class(dist) <- "LIHNPSD"
  dist <- rawmean(dist)



