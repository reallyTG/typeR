library(npsp)


### Name: fitsvar.sb.iso
### Title: Fit an isotropic Shapiro-Botha variogram model
### Aliases: fitsvar.sb.iso

### ** Examples

# Trend estimation
lp <- locpol(aquifer[,1:2], aquifer$head, nbin = c(41,41),
             h = diag(100, 2), hat.bin = TRUE)
                               # 'np.svariso.corr()' requires a 'lp$locpol$hat' component

# Variogram estimation
esvar <- np.svariso.corr(lp, maxlag = 150, nlags = 60, h = 60, plot = FALSE)

# Variogram fitting
svm2 <- fitsvar.sb.iso(esvar)  # dk = 2
svm3 <- fitsvar.sb.iso(esvar, dk = 0) # To avoid negative covariances...
svm4 <- fitsvar.sb.iso(esvar, dk = 10) # To improve fit...

plot(svm4, main = "Nonparametric bias-corrected semivariogram and fitted models", legend = FALSE)
plot(svm3, add = TRUE)
plot(svm2, add = TRUE, lty = 3)
legend("bottomright", legend = c("NP estimates", "fitted model (dk = 10)", "dk = 0", "dk = 2"),
            lty = c(NA, 1, 1, 3), pch = c(1, NA, NA, NA), lwd = c(1, 2, 1, 1))



