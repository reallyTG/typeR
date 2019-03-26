library(spatstat)


### Name: eval.fv
### Title: Evaluate Expression Involving Functions
### Aliases: eval.fv
### Keywords: spatial manip programming

### ** Examples

  # manipulating the K function
  X <- rpoispp(42)
  Ks <- Kest(X)

  eval.fv(Ks + 3)
  Ls <- eval.fv(sqrt(Ks/pi))

  # manipulating two K functions
  Y <- rpoispp(20)
  Kr <- Kest(Y)
  
  Kdif <- eval.fv(Ks - Kr)
  Z <- eval.fv(sqrt(Ks/pi) - sqrt(Kr/pi))

  ## Use of 'envir'
  U <- eval.fv(sqrt(K), list(K=Kest(cells)))

  ## Use of 'equiv'
  Fc <- Fest(cells)
  Gc <- Gest(cells)
  # Hanisch and Chiu-Stoyan estimators are cognate
  Dc <- eval.fv(Fc - Gc, equiv=list(cs="han"))



