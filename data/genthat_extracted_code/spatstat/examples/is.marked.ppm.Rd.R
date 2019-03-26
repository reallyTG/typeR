library(spatstat)


### Name: is.marked.ppm
### Title: Test Whether A Point Process Model is Marked
### Aliases: is.marked.ppm is.marked.lppm
### Keywords: spatial manip models

### ** Examples

   X <- lansing
   # Multitype point pattern --- trees marked by species

   ## Don't show: 
      # Smaller dataset
      X <- amacrine
   
## End(Don't show)

  fit1 <- ppm(X, ~ marks, Poisson())
  is.marked(fit1)
  # TRUE

  fit2 <- ppm(X, ~ 1, Poisson())
  is.marked(fit2)
  # TRUE

  # Unmarked point pattern
  fit3 <- ppm(cells, ~ 1, Poisson())
  is.marked(fit3)
  # FALSE




