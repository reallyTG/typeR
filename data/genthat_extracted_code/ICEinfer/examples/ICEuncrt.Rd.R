library(ICEinfer)


### Name: ICEuncrt
### Title: Compute Bootstrap Distribution of ICE Uncertainty for given
###   Shadow Price of Health, lambda
### Aliases: ICEuncrt
### Keywords: methods nonparametric robust

### ** Examples

  data(dulxparx)
  # Generating a bootstrap ICE uncertainty distribution is time consuming.
  dpunc <- ICEuncrt(dulxparx, dulx, idb, ru, lambda=0.26)
  plot(dpunc)
  # Transforming an existing bootstrap ICE uncertainty distribution is fast.
  dpuncX <- plot(dpunc, lfact=10)



