library(spatstat)


### Name: cdf.test
### Title: Spatial Distribution Test for Point Pattern or Point Process
###   Model
### Aliases: cdf.test cdf.test.ppm cdf.test.lppm cdf.test.lpp cdf.test.ppp
###   cdf.test.slrm
### Keywords: htest spatial

### ** Examples

   op <- options(useFancyQuotes=FALSE)

   # test of CSR using x coordinate
   cdf.test(nztrees, "x")
   cdf.test(nztrees, "x", "cvm")
   cdf.test(nztrees, "x", "ad")

   # test of CSR using a function of x and y
   fun <- function(x,y){2* x + y}
   cdf.test(nztrees, fun)

   # test of CSR using an image covariate
   funimage <- as.im(fun, W=Window(nztrees))
   cdf.test(nztrees, funimage)

   # fit inhomogeneous Poisson model and test
   model <- ppm(nztrees ~x)
   cdf.test(model, "x")

   if(interactive()) {
     # synthetic data: nonuniform Poisson process
     X <- rpoispp(function(x,y) { 100 * exp(x) }, win=square(1))

     # fit uniform Poisson process
     fit0 <- ppm(X ~1)
     # fit correct nonuniform Poisson process
     fit1 <- ppm(X ~x)

     # test wrong model
     cdf.test(fit0, "x")
     # test right model
     cdf.test(fit1, "x")
   }

   # multitype point pattern
   cdf.test(amacrine, "x")
   yimage <- as.im(function(x,y){y}, W=Window(amacrine))
   cdf.test(ppm(amacrine ~marks+y), yimage)

   options(op)



