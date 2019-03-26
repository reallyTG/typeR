library(ICEinfer)


### Name: ICEwedge
### Title: Equivariant Wedge-Shaped ICE Region with Confidence Level from
###   0.50 to 0.99
### Aliases: ICEwedge
### Keywords: methods nonparametric robust

### ** Examples

  data(dpunc)
  # ICEwedge() calculations may take more than 5 seconds...
  dpwdg <- ICEwedge(dpunc)
  plot(dpwdg)
  # ICEwedge() computations from an alias (rather than alibi) perspective...
  dpwdg0 <- ICEwedge(dpunc, lfact=0)
  plot(dpwdg0)



