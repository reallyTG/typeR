library(sme)


### Name: plotSmeDiagnostic
### Title: Diagnostic plot of the residuals for a fitted smoothing-splines
###   mixed-effects model
### Aliases: plotSmeDiagnostic

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  plotSmeDiagnostic(fit)



