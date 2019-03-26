library(spatstat)


### Name: cdf.test.mppm
### Title: Spatial Distribution Test for Multiple Point Process Model
### Aliases: cdf.test.mppm
### Keywords: htest spatial

### ** Examples

   # three i.i.d. realisations of nonuniform Poisson process
   lambda <- as.im(function(x,y) { 300 * exp(x) }, square(1))
   dat <- hyperframe(X=list(rpoispp(lambda), rpoispp(lambda), rpoispp(lambda)))

   # fit uniform Poisson process
   fit0 <- mppm(X~1, dat)
   # fit correct nonuniform Poisson process
   fit1 <- mppm(X~x, dat)

   # test wrong model
   cdf.test(fit0, "x")
   # test right model
   cdf.test(fit1, "x")

   # Gibbs model
   fitGibbs <- update(fit0, interaction=Strauss(0.07))
   ns <- if(interactive()) 19 else 3
   cdf.test(fitGibbs, "x", nsim=ns)



