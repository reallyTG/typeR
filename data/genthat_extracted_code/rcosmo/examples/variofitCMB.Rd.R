library(rcosmo)


### Name: variofitCMB
### Title: Estimates parameters of variograms
### Aliases: variofitCMB

### ** Examples

#
# df <- CMBDataFrame("../CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 10000)
# varcmb <- variogramCMB(cmbdf, max.dist = 0.1, num.bins = 30)
# varcmb
#
# ols <- variofitCMB(varcmb,  fix.nug=FALSE, wei="equal", cov.model= "matern")
# plot(varcmb)
# lines(ols, lty=2)
# str(ols)
#
# ols <- variofitCMB(varcmb, fix.nug = TRUE, kappa = 3, wei = "equal",
# cov.model = "askey")
# plot(varcmb, main = ols$cov.model)
# linesCMB(ols, lty = 2)
# str(ols)




