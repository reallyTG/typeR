library(rcosmo)


### Name: linesCMB
### Title: Adds lines of fitted variograms to variogram plots
### Aliases: linesCMB

### ** Examples

## Plot the fitted Matern variogram versus its empirical variogram
#
# df <- CMBDataFrame("../CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 10000)
# varcmb <- variogramCMB(cmbdf, max.dist = 0.1, num.bins = 30)
# varcmb
# ols <- variofitCMB(varcmb,  fix.nug=FALSE, wei="equal", cov.model= "matern")
# plot(varcmb)
# lines(ols, lty=2)
#
## Plot the fitted Askey variogram versus its empirical variogram
#
# ols <- variofitCMB(vario1, ini.cov.pars = c(1, 0.03), fix.nug = TRUE,
#     kappa = 3, wei = "equal", cov.model = "askey")
# plot(varcmb, main = ols$cov.model)
# linesCMB(ols, lty = 2)




