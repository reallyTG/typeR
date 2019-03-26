library(nadiv)


### Name: grfx
### Title: Simulated genetic random effects
### Aliases: grfx

### ** Examples


# Create additive genetic breeding values for 2 uncorrelated traits
# with different additive genetic variances
  A <- makeA(warcolak[1:200, 1:3])
  Gmat <- matrix(c(20, 0, 0, 10), 2, 2)
  breedingValues <- grfx(n = 200, G = Gmat, incidence = A, saveIncidence = FALSE)

 # Now with a user supplied set of standard normal deviates
  snorms <- rnorm(nrow(warcolak[1:200,]) * ncol(Gmat))
  breedingValues2a <- grfx(n = 200, G = Gmat, incidence = A, stdnorms = snorms)
  breedingValues2b <- grfx(n = 200, G = Gmat, incidence = A, stdnorms = snorms)
  identical(breedingValues2a, breedingValues2b)  # TRUE
  var(breedingValues2a)
  var(breedingValues2b)





