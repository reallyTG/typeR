library(dbmss)


### Name: gEnvelope
### Title: Estimation of the confidence envelope of the g function under
###   its null hypothesis
### Aliases: gEnvelope

### ** Examples

data(paracou16)
# Keep only 20% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.2))
plot(X)

# Calculate confidence envelope (should be 1000 simulations, reduced to 10 to save time)
r <- 0:40
NumberOfSimulations <- 10
# Plot the envelope
plot(gEnvelope(X, r, NumberOfSimulations))



