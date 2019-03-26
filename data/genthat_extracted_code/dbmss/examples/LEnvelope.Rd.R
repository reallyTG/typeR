library(dbmss)


### Name: LEnvelope
### Title: Estimation of the confidence envelope of the L function under
###   its null hypothesis
### Aliases: LEnvelope

### ** Examples

data(paracou16)
# Keep only 20% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.2))
plot(X)

# Calculate confidence envelope (should be 1000 simulations, reduced to 20 to save time)
r <- 0:30
NumberOfSimulations <- 20
# Plot the envelope
plot(LEnvelope(X, r, NumberOfSimulations))



