library(mritc)


### Name: initNormMix
### Title: Get the Initial Estimate of the Parameters of a Normal Mixture
###   Model
### Aliases: initOtsu initProp
### Keywords: classif

### ** Examples

  #Example 1
  prop <- c(.3, .4, .3)
  mu <- c(40,  90, 130)
  sigma <- c(4, 8, 4)
  y <- floor(rnormmix(n=100000, prop, mu, sigma)[,1])
  initOtsu(y, 2)
  initProp(y, prop)

  #Example 2
  T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
                c(91,109,91), format="rawb.gz")
  mask <-readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
                 c(91,109,91), format="rawb.gz")
  initOtsu(T1[mask==1], 2)
  initProp(T1[mask==1], c(0.17, 0.48, 0.35))



