library(fmri)


### Name: fmri.detrend
### Title: Detrend fMRI time series
### Aliases: fmri.detrend
### Keywords: regression

### ** Examples

  # Example 1
  data <- list(ttt=writeBin(rnorm(32*32*32*107),raw(),4),
               mask=array(1,c(32,32,32)),dim=c(32,32,32,107))
  class(data) <- "fmridata"
  data <- fmri.detrend(data,2)



