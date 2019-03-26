library(mev)


### Name: gpd.tem
### Title: Tangent exponential model approximation for the GP distribution
### Aliases: gpd.tem

### ** Examples

set.seed(123)
dat <- evd::rgpd(n = 40, scale = 1, shape = -0.1)
#with plots
m1 <- gpd.tem(param = "shape", n.psi = 50, dat = dat, plot = TRUE)
m2 <- gpd.tem(param = "scale", n.psi = 50, dat = dat)
m3 <- gpd.tem(param = "VaR", n.psi = 50, dat = dat, m = 100)
#Providing psi
## Not run: 
##D psi <- c(seq(2, 5, length = 15), seq(5, 35, length = 45))
##D m4 <- gpd.tem(param = "ES", dat = dat, m = 100, psi = psi, correction = FALSE)
##D plot.fr(m4, which = c(2, 4))
##D plot(fr4 <- spline.corr(m4))
##D confint(m1)
##D confint(m4, parm = 2, warn = FALSE)
##D m5 <- gpd.tem(param = "Nmean", dat = dat, N = 100, psi = psi, correction = FALSE)
##D m6 <- gpd.tem(param = "Nquant", dat = dat, N = 100, q = 0.7, correction = FALSE)
## End(Not run)



