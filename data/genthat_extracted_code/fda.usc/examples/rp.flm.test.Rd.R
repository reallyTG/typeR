library(fda.usc)


### Name: rp.flm.test
### Title: Goodness-of fit test for the functional linear model using
###   random projections
### Aliases: rp.flm.test

### ** Examples

#' # Simulated example

set.seed(345678)
t <- seq(0, 1, l = 101)
n <- 100
X <- r.ou(n = n, t = t, alpha = 2, sigma = 0.5)
beta0 <- fdata(mdata = cos(2 * pi * t) - (t - 0.5)^2, argvals = t,
               rangeval = c(0,1))
Y <- inprod.fdata(X, beta0) + rnorm(n, sd = 0.1)

# Test all cases
rp.flm.test(X.fdata = X, Y = Y, est.method = "pc")
## Not run: 
##D rp.flm.test(X.fdata = X, Y = Y, est.method = "pls")
##D rp.flm.test(X.fdata = X, Y = Y, est.method = "basis", 
##D             p.criterion = fda.usc::GCV.S)
##D rp.flm.test(X.fdata = X, Y = Y, est.method = "pc", p = 5)
##D rp.flm.test(X.fdata = X, Y = Y, est.method = "pls", p = 5)
##D rp.flm.test(X.fdata = X, Y = Y, est.method = "basis", p = 5)
##D rp.flm.test(X.fdata = X, Y = Y, beta0.fdata = beta0)
##D 
##D # Composite hypothesis: do not reject FLM
##D rp.test <- rp.flm.test(X.fdata = X, Y = Y, est.method = "pc")
##D rp.test$p.values.fdr
##D pcvm.test <- flm.test(X.fdata = X, Y = Y, est.method = "pc", B = 1e3,
##D                       plot.it = FALSE)
##D pcvm.test
##D 
##D # Estimation of beta
##D par(mfrow = c(1, 3))
##D plot(X, main = "X")
##D plot(beta0, main = "beta")
##D lines(rp.test$beta.est, col = 2)
##D lines(pcvm.test$beta.est, col = 3)
##D plot(density(Y), main = "Density of Y", xlab = "Y", ylab = "Density")
##D rug(Y)
##D 
##D # Simple hypothesis: do not reject beta = beta0
##D rp.flm.test(X.fdata = X, Y = Y, beta0.fdata = beta0)$p.values.fdr
##D flm.test(X.fdata = X, Y = Y, beta0.fdata = beta0, B = 1e3, plot.it = FALSE)
##D 
##D # Simple hypothesis: reject beta = beta0^2
##D rp.flm.test(X.fdata = X, Y = Y, beta0.fdata = beta0^2)$p.values.fdr
##D flm.test(X.fdata = X, Y = Y, beta0.fdata = beta0^2, B = 1e3, plot.it = FALSE)
##D 
##D # Tecator dataset
##D 
##D # Load data
##D data(tecator)
##D absorp <- tecator$absorp.fdata
##D ind <- 1:129 # or ind <- 1:215
##D x <- absorp[ind, ]
##D y <- tecator$y$Fat[ind]
##D 
##D # Composite hypothesis
##D rp.tecat <- rp.flm.test(X.fdata = x, Y = y, est.method = "pc")
##D pcvm.tecat <- flm.test(X.fdata = x, Y = y, est.method = "pc", B = 1e3,
##D                        plot.it = FALSE)
##D rp.tecat$p.values.fdr[c(5, 10), ]
##D pcvm.tecat
##D 
##D # Simple hypothesis
##D zero <- fdata(mdata = rep(0, length(x$argvals)), argvals = x$argvals,
##D               rangeval = x$rangeval)
##D rp.flm.test(X.fdata = x, Y = y, beta0.fdata = zero)
##D flm.test(X.fdata = x, Y = y, beta0.fdata = zero, B = 1e3)
##D 
##D # With derivatives
##D rp.tecat <- rp.flm.test(X.fdata = fdata.deriv(x, 1), Y = y, est.method = "pc")
##D rp.tecat$p.values.fdr
##D rp.tecat <- rp.flm.test(X.fdata = fdata.deriv(x, 2), Y = y, est.method = "pc")
##D rp.tecat$p.values.fdr
##D 
##D # AEMET dataset
##D 
##D # Load data
##D data(aemet)
##D wind.speed <- apply(aemet$wind.speed$data, 1, mean)
##D temp <- aemet$temp
##D 
##D # Remove the 5% of the curves with less depth (i.e. 4 curves)
##D par(mfrow = c(1, 1))
##D res.FM <- depth.FM(temp, draw = TRUE)
##D qu <- quantile(res.FM$dep, prob = 0.05)
##D l <- which(res.FM$dep <= qu)
##D lines(aemet$temp[l], col = 3)
##D 
##D # Data without outliers
##D wind.speed <- wind.speed[-l]
##D temp <- temp[-l]
##D 
##D # Composite hypothesis
##D rp.aemet <- rp.flm.test(X.fdata = temp, Y = wind.speed, est.method = "pc")
##D pcvm.aemet <- flm.test(X.fdata = temp, Y = wind.speed, B = 1e3,
##D                        est.method = "pc", plot.it = FALSE)
##D rp.aemet$p.values.fdr
##D apply(rp.aemet$p.values.fdr, 2, range)
##D pcvm.aemet
##D 
##D # Simple hypothesis
##D zero <- fdata(mdata = rep(0, length(temp$argvals)), argvals = temp$argvals,
##D               rangeval = temp$rangeval)
##D flm.test(X.fdata = temp, Y = wind.speed, beta0.fdata = zero, B = 1e3,
##D          plot.it = FALSE)
##D rp.flm.test(X.fdata = temp, Y = wind.speed, beta0.fdata = zero)
## End(Not run)



