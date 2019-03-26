library(ExceedanceTools)


### Name: statistic.sim
### Title: Simulates statistics related to exceedance region.
### Aliases: statistic.sim

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
spcov <- cov.sp(coords = coords, sp.type = "exponential", sp.par = c(1, 1.5),
 error.var = 1/3, finescale.var = 0, pcoords = pcoords)

# Predict responses at pgrid locations
krige.obj <- krige.uk(y = as.vector(sdata$y), V = spcov$V, Vp = spcov$Vp,
 Vop = spcov$Vop, X = X, Xp = Xp, nsim = 50,
 Ve.diag = rep(1/3, length(sdata$y)) , method = "chol")

# Simulate distribution of test statistic for different alternatives
statistic.sim.obj.less <- statistic.sim(krige.obj = krige.obj, level = 5,
 alternative = "less")
statistic.sim.obj.greater <- statistic.sim(krige.obj = krige.obj, level = 5,
 alternative = "greater")
# Construct null and rejection sets for two scenarios
n90 <- exceedance.ci(statistic.sim.obj.less, conf.level = .90, type = "null")
r90 <- exceedance.ci(statistic.sim.obj.greater,conf.level = .90,
 type = "rejection")
# Plot results
plot(pgrid, n90, col="blue", add = FALSE, xlab = "x", ylab = "y")
plot(pgrid, r90, col="orange", add = TRUE)
legend("bottomleft",
 legend = c("contains true exceedance region with 90 percent confidence",
 "is contained in true exceedance region with 90 percent confidence"),
 col = c("blue", "orange"), lwd = 10)

# Example for level curves
data(colorado)
ocoords <- colorado$ocoords
odata <- colorado$odata

# Set up example
nsim <- 50
u <- log(16)
np <- 26
conf.level <- 0.90
x.min <- min(ocoords[,1])
x.max <- max(ocoords[,1])
y.min <- min(ocoords[,2])
y.max <- max(ocoords[,2])

#pixelize the domain
pgrid <- create.pgrid(x.min, x.max, y.min, y.max, nx = np, ny = np)
pcoords <- pgrid$pgrid; upx <- pgrid$upx; upy <- pgrid$upy
names(pcoords) <- c("lon", "lat")

# Set up covariates matrices
X <- cbind(1, ocoords)
Xp <- cbind(1, pcoords)

# Estimate covariance parameters
cov.est <- maxlik.cov.sp(X, odata, sp.type = "exponential", range.par = 1.12,
 error.ratio = 0.01, reml = TRUE, coords = ocoords)

# Create covariance matrices
myCov <- cov.sp(coords = ocoords, sp.type = "exponential",
 sp.par = cov.est$sp.par, error.var = cov.est$error.var, pcoords = pcoords)

# Krige and do conditional simulation
krige.obj <- krige.uk(y = odata, V = myCov$V, Vp = myCov$Vp, Vop = myCov$Vop,
 X = X, Xp = Xp, nsim = nsim, Ve.diag = rep(cov.est$error.var,
 length(odata)))

# Create user covariance function for simulating statistic for confidence
# regions
user.cov <- function(cLcoords,...)
{
   arglist <- list(...)
   coords <- arglist$coords
   sp.type <- arglist$sp.type
   sp.par <- arglist$sp.par
   V <- arglist$V
   out <- list(V = arglist$V,
               Vp = sp.par[1] * exp(-dist1(cLcoords)/sp.par[2]),
               Vop = sp.par[1] * exp(-dist2(coords, cLcoords)/sp.par[2]))
   out$Xp <- cbind(1, cLcoords)
   return(out)
}

# Simulation statistic for confidence regions
statistic.sim.obj <- statistic.sim(krige.obj = krige.obj, level = u,
 alternative = "two.sided", user.cov = user.cov, y = odata, pgrid = pgrid,
 X = X, coords = ocoords, pcoords = pcoords, V = myCov$V,
 sp.type = "exponential", sp.par = cov.est$sp.par)

# Create 90% confidence region
n90 <- exceedance.ci(statistic.sim.obj, conf.level = conf.level,
 type = "null")
# Get estimated contour lines
cL <- contourLines(pgrid$upx, pgrid$upy, matrix(krige.obj$pred, nrow = np),
 level = u)

# Plot results
plot(ocoords, xlab = "longitude", ylab = "latitude", type = "n",
 cex.lab = 1.5, cex.axis = 1.5)
plot(pgrid, n90, col = "grey", add = TRUE)
plot.contourLines(cL, col="black", lwd=2, lty = 2, add = TRUE)



