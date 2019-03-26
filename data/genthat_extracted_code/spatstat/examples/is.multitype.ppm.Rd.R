library(spatstat)


### Name: is.multitype.ppm
### Title: Test Whether A Point Process Model is Multitype
### Aliases: is.multitype.ppm is.multitype.lppm
### Keywords: spatial manip models

### ** Examples

   X <- lansing
   # Multitype point pattern --- trees marked by species

   ## Don't show: 
      # Smaller dataset
      X <- amacrine
   
## End(Don't show)

  fit1 <- ppm(X, ~ marks, Poisson())
  is.multitype(fit1)
  # TRUE

  fit2 <- ppm(X, ~ 1, Poisson())
  is.multitype(fit2)
  # TRUE

  # Unmarked point pattern
  fit3 <- ppm(cells, ~ 1, Poisson())
  is.multitype(fit3)
  # FALSE




