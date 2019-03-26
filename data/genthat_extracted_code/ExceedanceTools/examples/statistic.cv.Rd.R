library(ExceedanceTools)


### Name: statistic.cv
### Title: Return critical value of distribution.
### Aliases: statistic.cv

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
 Vop = spcov$Vop, X = X, Xp = Xp, nsim = 100,
 Ve.diag = rep(1/3, length(sdata$y)) , method = "chol")

# Simulate distribution of test statistic for different alternatives
statistic.sim.obj.less <- statistic.sim(krige.obj = krige.obj, level = 5,
 alternative = "less")
statistic.sim.obj.greater <- statistic.sim(krige.obj = krige.obj, level = 5,
 alternative = "greater")
# Calculate quantiles of distribution of statistic
q90.less <- statistic.cv(statistic.sim.obj.less, conf.level = .90)
q90.greater <- statistic.cv(statistic.sim.obj.greater, conf.level = .90)



