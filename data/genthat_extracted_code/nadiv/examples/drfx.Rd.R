library(nadiv)


### Name: drfx
### Title: Simulated design random effects
### Aliases: drfx

### ** Examples


# Create maternal common environment effects for 2 traits
# with perfectly correlated effects
  Gmat <- matrix(c(10, 7.071, 7.071, 5), 2, 2)
  cfx <- drfx(G = Gmat, fac = "Dam", dataf = warcolak[1:200, ])





