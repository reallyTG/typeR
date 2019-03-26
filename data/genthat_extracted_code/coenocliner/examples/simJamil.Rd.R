library(coenocliner)


### Name: simJamil
### Title: Simulate species abundance data following Jamil & ter Braak
###   (2013)
### Aliases: simJamil
### Keywords: datagen

### ** Examples

set.seed(42)
N <- 100   # Number of locations on gradient (samples)
glen <- 4  # Gradient length
grad <- sort(runif(N, -glen/2, glen/2)) # sample locations
M <- 10    # Number of species
sim <- simJamil(n = N, m = M, x = grad, gl = glen, randx = FALSE,
                randm = FALSE, expectation = TRUE)
## visualise the response curves
matplot(grad, sim, type = "l", lty = "solid")

## simulate binomial responses from those response curves
sim <- simJamil(n = N, m = M, x = grad, gl = glen, randx = FALSE,
                randm = FALSE)




