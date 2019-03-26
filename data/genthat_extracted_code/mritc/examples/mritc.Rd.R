library(mritc)


### Name: mritc
### Title: MRI Tissue Classification Using Various Methods
### Aliases: mritc.em mritc.icm mritc.hmrfem mritc.pvhmrfem mritc.bayes
###   mritc
### Keywords: classif

### ** Examples

  #Example 1
  T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
                c(91,109,91), format="rawb.gz")
  mask <- readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
                  c(91,109,91), format="rawb.gz")
  y <- T1[mask==1]
  initial <- initOtsu(y, 2)
  prop <- initial$prop
  mu <- initial$mu
  sigma <- initial$sigma
  tc.em <- mritc.em(y, prop, mu, sigma, verbose=TRUE)
 
  ## Not run: 
##D   mrispatial <- makeMRIspatial(mask, nnei=6, sub=FALSE)
##D   tc.icm <- mritc.icm(y, mrispatial$neighbors, mrispatial$blocks,
##D                       mu=mu, sigma=sigma, verbose=TRUE)
##D   tc.hmrfem <- mritc.hmrfem(y, mrispatial$neighbors, mrispatial$blocks,
##D                             mu=mu, sigma=sigma, verbose=TRUE)
##D   tc.pvhmrfem <- mritc.pvhmrfem(y, mrispatial$neighbors, mrispatial$blocks,
##D                                 mu=mu, sigma=sigma, verbose=TRUE)
##D   tc.mcmc <- mritc.bayes(y, mrispatial$neighbors, mrispatial$blocks,
##D                          mrispatial$sub, mrispatial$subvox,
##D                          mu=mu, sigma=sigma, verbose=TRUE)
##D 
##D   mrispatial <- makeMRIspatial(mask, nnei=6, sub=TRUE)
##D   tc.mcmcsub <- mritc.bayes(y, mrispatial$neighbors, mrispatial$blocks,
##D                          mrispatial$sub, mrispatial$subvox,
##D                          mu=mu, sigma=sigma, verbose=TRUE)
##D 
##D   mrispatial26 <- makeMRIspatial(mask, nnei=26, sub=TRUE, bias=TRUE)
##D   tc.mcmcsubbias <- mritc.bayes(y, mrispatial$neighbors, mrispatial$blocks,
##D                                 mrispatial$sub, mrispatial$subvox,
##D                                 subbias=TRUE, mrispatial26$neighbors,
##D                                 mrispatial26$blocks,mrispatial26$weineighbors,
##D                                 mrispatial26$weights, mu=mu, sigma=sigma, verbose=TRUE)
##D 
##D   
## End(Not run)
  #Example 2
  T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
                c(91,109,91), format="rawb.gz")
  mask <-readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
                 c(91,109,91), format="rawb.gz")
  tc.icm <- mritc(T1, mask, method="ICM")



