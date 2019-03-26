library(fda.usc)


### Name: rp.flm.statistic
### Title: Statistics for testing the functional linear model using random
###   projections
### Aliases: rp.flm.statistic

### ** Examples

# Simulated example
set.seed(345678)
t <- seq(0, 1, l = 101)
n <- 100
X <- r.ou(n = n, t = t)
beta0 <- fdata(mdata = cos(2 * pi * t) - (t - 0.5)^2, argvals = t,
               rangeval = c(0,1))
Y <- inprod.fdata(X, beta0) + rnorm(n, sd = 0.1)

# Linear model
mod <- fregre.pc(fdataobj = X, y = Y, l = 1:3)

# Projections
proj.X1 <- inprod.fdata(X, r.ou(n = 1, t = t))
proj.X2 <- inprod.fdata(X, r.ou(n = 1, t = t))
proj.X12 <- cbind(proj.X1, proj.X2)

# Statistics
t1 <- rp.flm.statistic(proj.X = proj.X1, residuals = mod$residuals)
t2 <- rp.flm.statistic(proj.X = proj.X2, residuals = mod$residuals)
t12 <- rp.flm.statistic(proj.X = proj.X12, residuals = mod$residuals)
t1$statistic
t2$statistic
t12$statistic

# Recycling proj.X.ord
rp.flm.statistic(proj.X.ord = t1$proj.X.ord, residuals = mod$residuals)$statistic
t1$statistic

# Sort in the columns
cbind(proj.X12[t12$proj.X.ord[, 1], 1], proj.X12[t12$proj.X.ord[, 2], 2]) -
apply(proj.X12, 2, sort)

# FORTRAN and R code
rp.flm.statistic(proj.X = proj.X1, residuals = mod$residuals)$statistic -
rp.flm.statistic(proj.X = proj.X1, residuals = mod$residuals, 
                 F.code = FALSE)$statistic

# Matrix and vector residuals
rp.flm.statistic(proj.X = proj.X12, residuals = mod$residuals)$statistic
rp.flm.statistic(proj.X = proj.X12, 
                 residuals = rbind(mod$residuals, mod$residuals * 2))$statistic



