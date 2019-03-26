library(dbmss)


### Name: MEnvelope
### Title: Estimation of the confidence envelope of the M function under
###   its null hypothesis
### Aliases: MEnvelope

### ** Examples

data(paracou16)
# Keep only 50% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.5))
plot(X)

# Calculate confidence envelope (should be 1000 simulations, reduced to 4 to save time)
NumberOfSimulations <- 4
Alpha <- .10
plot(MEnvelope(X, , NumberOfSimulations, Alpha, 
    "V. Americana", "Q. Rosea", FALSE, "RandomLabeling"))



