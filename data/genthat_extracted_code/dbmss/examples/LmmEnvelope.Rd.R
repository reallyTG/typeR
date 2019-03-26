library(dbmss)


### Name: LmmEnvelope
### Title: Estimation of the confidence envelope of the Lmm function under
###   its null hypothesis
### Aliases: LmmEnvelope

### ** Examples

data(paracou16)
# Keep only 20% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.2))
plot(X)

# Calculate confidence envelope (should be 1000 simulations, reduced to 4 to save time)
r <- seq(0, 30, 2)
NumberOfSimulations <- 4
Alpha <- .10
plot(LmmEnvelope(X, r, NumberOfSimulations, Alpha))



