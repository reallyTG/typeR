library(dbmss)


### Name: KinhomEnvelope
### Title: Estimation of the confidence envelope of the Kinhom function
###   under its null hypothesis
### Aliases: KinhomEnvelope

### ** Examples

data(paracou16)
# Keep only 20% of points to run this example
X <- as.wmppp(rthin(paracou16, 0.2))
plot(X)

# Density of all trees
lambda <- density.ppp(X, bw.diggle(X))
plot(lambda)
V.americana <- X[X$marks$PointType=="V. Americana"]
plot(V.americana, add=TRUE)

# Calculate Kinhom according to the density of all trees
# and confidence envelope (should be 1000 simulations, reduced to 4 to save time)
r <- 0:30
NumberOfSimulations <- 4
Alpha <- .10
plot(KinhomEnvelope(X, r,NumberOfSimulations, Alpha, , 
    SimulationType="RandomPosition", lambda=lambda), ./(pi*r^2) ~ r)



