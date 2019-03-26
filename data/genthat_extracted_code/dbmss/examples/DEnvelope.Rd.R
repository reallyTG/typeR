library(dbmss)


### Name: DEnvelope
### Title: Estimation of the confidence envelope of the D function under
###   its null hypothesis
### Aliases: DEnvelope

### ** Examples

data(paracou16)
# Keep only 20% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.2))
plot(X)

# Calculate confidence envelope (should be 1000 simulations, reduced to 20 to save time)
r <- 0:30
NumberOfSimulations <- 20
Alpha <- .05
# Plot the envelope (after normalization by pi.r^2)
plot(DEnvelope(X, r, NumberOfSimulations, Alpha,
    "V. Americana", "Q. Rosea", Intertype = TRUE), ./(pi*r^2) ~ r)



