library(psychmeta)


### Name: compute_dmod_npar
### Title: Function for computing non-parametric d_Mod effect sizes for a
###   single focal group
### Aliases: compute_dmod_npar

### ** Examples

# Generate some hypothetical data for a referent group and three focal groups:
set.seed(10)
refDat <- MASS::mvrnorm(n = 1000, mu = c(.5, .2),
                        Sigma = matrix(c(1, .5, .5, 1), 2, 2), empirical = TRUE)
foc1Dat <- MASS::mvrnorm(n = 1000, mu = c(-.5, -.2),
                         Sigma = matrix(c(1, .5, .5, 1), 2, 2), empirical = TRUE)
foc2Dat <- MASS::mvrnorm(n = 1000, mu = c(0, 0),
                         Sigma = matrix(c(1, .3, .3, 1), 2, 2), empirical = TRUE)
foc3Dat <- MASS::mvrnorm(n = 1000, mu = c(-.5, -.2),
                         Sigma = matrix(c(1, .3, .3, 1), 2, 2), empirical = TRUE)
colnames(refDat) <- colnames(foc1Dat) <- colnames(foc2Dat) <- colnames(foc3Dat) <- c("X", "Y")

# Compute a regression model for each group:
refRegMod <- lm(Y ~ X, data.frame(refDat))$coef
foc1RegMod <- lm(Y ~ X, data.frame(foc1Dat))$coef
foc2RegMod <- lm(Y ~ X, data.frame(foc2Dat))$coef
foc3RegMod <- lm(Y ~ X, data.frame(foc3Dat))$coef

# Use the subgroup regression models to compute d_mod for each referent-focal pairing:

# Focal group #1:
compute_dmod_npar(referent_int = refRegMod[1], referent_slope = refRegMod[2],
             focal_int = foc1RegMod[1], focal_slope = foc1RegMod[2],
             focal_x = foc1Dat[,"X"], referent_sd_y = 1)

# Focal group #2:
compute_dmod_npar(referent_int = refRegMod[1], referent_slope = refRegMod[2],
             focal_int = foc2RegMod[1], focal_slope = foc1RegMod[2],
             focal_x = foc2Dat[,"X"], referent_sd_y = 1)

# Focal group #3:
compute_dmod_npar(referent_int = refRegMod[1], referent_slope = refRegMod[2],
             focal_int = foc3RegMod[1], focal_slope = foc3RegMod[2],
             focal_x = foc3Dat[,"X"], referent_sd_y = 1)



