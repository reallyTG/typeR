library(spatstat)


### Name: markcrosscorr
### Title: Mark Cross-Correlation Function
### Aliases: markcrosscorr
### Keywords: spatial nonparametric

### ** Examples

  # The dataset 'betacells' has two columns of marks:
  #       'type' (factor)
  #       'area' (numeric)
  if(interactive()) plot(betacells)
  plot(markcrosscorr(betacells))



