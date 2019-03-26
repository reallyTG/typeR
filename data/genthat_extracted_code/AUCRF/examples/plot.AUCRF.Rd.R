library(AUCRF)


### Name: plot.AUCRF
### Title: Plot Method for AUCRF
### Aliases: plot.AUCRF

### ** Examples

  data(fitCV)
  
  # Plotting the AUC in the AUCRF backward elimination process:
  plot(fitCV)
  
  # Plotting the probability of selection of the selected variables:
  plot(fitCV, wich="psel")
  
  # Plotting the 20 variables with highest probability of selection:
  plot(fitCV, wich="psel", maxvars=20)




