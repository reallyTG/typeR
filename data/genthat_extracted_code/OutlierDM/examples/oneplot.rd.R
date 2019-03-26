library(OutlierDM)


### Name: oneplot
### Title: Draw a dot-plot for a selected observation (peptide)
### Aliases: oneplot oneplot,OutlierDM-method
###   oneplot,OutlierDM,numeric-method
### Keywords: subfunction

### ** Examples

  data(lcms3)
  fit = odm(lcms3, method = "grubbs")
  oneplot(fit, i = 100)

  ## Not run: 
##D   # Add row name
##D   oneplot(fit, i = 100, pick = 1)
##D   
## End(Not run)



