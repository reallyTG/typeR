library(ExceedanceTools)


### Name: exceedance.ci
### Title: Return confidence region
### Aliases: exceedance.ci

### ** Examples

library(SpatialTools)

# Example for exceedance regions

set.seed(10)
# Load data
data(sdata)
# Create prediction grid
pgrid <- create.pgrid(0, 1, 0, 1, nx = 26, ny = 26)
pcoords <- pgrid$pgrid
# Create design matrices
coords = cbind(sdata$x1, sdata$x2)
X <- cbind(1, coords)
Xp <- cbind(1, pcoords)

# Generate covariance matrices V, Vp, Vop using appropriate parameters for
# observed data and responses to be predicted
spcov <- cov.sp(coords = coords, sp.type = "exponential",
 sp.par = c(1, 1.5), error.var = 1/3, finescale.var = 0, pcoords = pcoords)

# Predict responses at pgrid locations
krige.obj <- krige.uk(y = as.vector(sdata$y), V = spcov$V, Vp = spcov$Vp,
 Vop = spcov$Vop, X = X, Xp = Xp, nsim = 100,
 Ve.diag = rep(1/3, length(sdata$y)) , method = "chol")

# Simulate distribution of test statistic for different alternatives
statistic.sim.obj.less <- statistic.sim(krige.obj = krige.obj, level = 5,
 alternative = "less")
statistic.sim.obj.greater <- statistic.sim(krige.obj = krige.obj, level = 5,
 alternative = "greater")
# Construct null and rejection sets for two scenarios
n90 <- exceedance.ci(statistic.sim.obj.less, conf.level = .90, type = "null")
r90 <- exceedance.ci(statistic.sim.obj.greater,conf.level = .90, type = "rejection")
# Plot results
plot(pgrid, n90, col="blue", add = FALSE, xlab = "x", ylab = "y")
plot(pgrid, r90, col="orange", add = TRUE)
legend("bottomleft",
 legend = c("contains true exceedance region with 90 percent confidence",
   "is contained in true exceedance region with 90 percent confidence"),
   col = c("blue", "orange"), lwd = 10)



