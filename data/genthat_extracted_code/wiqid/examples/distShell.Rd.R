library(wiqid)


### Name: distShell
### Title: Distance Matrix Computation
### Aliases: distShell

### ** Examples

# Use the artificial data set, see ?distTestData
data(distTestData)

# Using distance measure functions in this package:
distShell(distTestData, distSorensen)
distShell(distTestData, distMorisitaHorn)

# Write a customised distance function:
K <- function(a1, a2)  {
  shared <- sum(a1 > 0 & a2 > 0)
  notshared <- sum(xor(a1 > 0, a2 > 0))
  shared / notshared
}
distShell(distTestData, K)
# This returns Inf if the number of species not shared is zero. May not be a good measure!



