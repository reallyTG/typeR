library(ICEinfer)


### Name: ICEalice
### Title: Functions to compute and display ICE Acceptability Curves
### Aliases: ICEalice
### Keywords: methods

### ** Examples

  # Read in previously computed ICEwedge output list.
  data(dpwdg)
  dpacc <- ICEalice(dpwdg)
  # Display the ALICE curve.
  plot(dpacc, show="Alice")
  dpacc



