library(dfphase1)


### Name: phase1Plot
### Title: Plot of Phase 1 data
### Aliases: phase1Plot mphase1Plot
### Keywords: hplot

### ** Examples

  x <- matrix(rt(5*20,5),5)
  x[,10] <- x[,10]+3
  phase1Plot(x)
  # a data set with many variables
  x <- array(rnorm(20*5*50),c(20,5,50))+10*(1:20)
  mphase1Plot(x)
  # it is better to organize the plot on two pages
  if (interactive()) old <- grDevices::devAskNewPage(TRUE)
  mphase1Plot(x,c(2,5,2))
  if (interactive()) grDevices::devAskNewPage(old)



