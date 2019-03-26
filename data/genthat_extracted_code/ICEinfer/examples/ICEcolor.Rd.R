library(ICEinfer)


### Name: ICEcolor
### Title: Compute Preference Colors for Outcomes within a Bootstrap
###   Confidence Wedge
### Aliases: ICEcolor
### Keywords: methods

### ** Examples

  # Read in previously computed ICEwedge output list.
  data(dpwdg)
  dpcol <- ICEcolor(dpwdg)
  # Display preference coloring for the stored value of lambda.
  plot(dpcol, show="RBOW")
  dpcolX <- ICEcolor(dpwdg, lfact=10)
  # Display preference coloring when lambda is increased by a factor of 10.
  plot(dpcolX, show="RBOW")



