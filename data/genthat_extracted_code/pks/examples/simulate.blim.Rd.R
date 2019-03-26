library(pks)


### Name: simulate.blim
### Title: Simulate Responses from Basic Local Independence Models (BLIMs)
### Aliases: simulate.blim
### Keywords: models

### ** Examples

data(DoignonFalmagne7)
 
blim1 <- blim(DoignonFalmagne7$K, DoignonFalmagne7$N.R)

simulate(blim1)

## Parametric bootstrap
disc <- replicate(200, blim(blim1$K, simulate(blim1))$discrepancy)

hist(disc, col = "lightgray", border = "white", freq = FALSE, breaks = 20,
     main = "Parametric bootstrap", xlim = c(.05, .3))
abline(v = blim1$discrepancy, lty = 2)



