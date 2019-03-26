library(VarianceGamma)


### Name: vgMom
### Title: Calculate Moments of the Variance Gamma Distribution
### Aliases: vgMom
### Keywords: distribution

### ** Examples

  ### Raw moments of the VG distribution
  vgMom(3, param=c(2,1,2,1), momType = "raw")

  ### Mu moments of the VG distribution
  vgMom(2, param=c(2,1,2,1), momType = "mu")

  ### Central moments of the VG distribution
  vgMom(4, param=c(2,1,2,1), momType = "central")

  ### Moments about any locations
  vgMom(4, param=c(2,1,2,1), about = 1)



