library(qrmtools)


### Name: ARMA_GARCH
### Title: Fitting ARMA-GARCH Processes
### Aliases: fit_ARMA_GARCH
### Keywords: ts

### ** Examples

library(rugarch)
library(copula)

## Read the data, build -log-returns
data(SMI.12) # Swiss Market Index data
stocks <- c("CSGN", "BAER", "UBSN", "SREN", "ZURN") # components we work with
x <- SMI.12[, stocks]
X <- -returns(x)
n <- nrow(X)
d <- ncol(X)

## Fit ARMA-GARCH models to the -log-returns
## Note: - Our choice here is purely for demonstration purposes.
##         The models are not necessarily adequate
##       - The sample size n is *too* small here for properly capturing GARCH effects.
##         Again, this is only for demonstration purposes here.
uspec <- c(rep(list(ugarchspec(distribution.model = "std")), d-2), # ARMA(1,1)-GARCH(1,1)
           list(ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(2,2)),
                           distribution.model = "std")),
           list(ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(2,1)),
                           mean.model = list(armaOrder = c(1,2), include.mean = TRUE),
                           distribution.model = "std")))
system.time(fitAG <- fit_ARMA_GARCH(X, ugarchspec.list = uspec))
str(fitAG, max.level = 1) # list with components fit, warning, error
stopifnot(sapply(fitAG$error, is.null)) # NULL = no error
stopifnot(sapply(fitAG$warning, is.null)) # NULL = no warning

## Not run: 
##D ## Pick out the standardized residuals, plot them and fit a t copula to them
##D ## Note: ugarchsim() needs the residuals to be standardized; working with
##D ##       standardize = FALSE still requires to simulate them from the
##D ##       respective standardized marginal distribution functions.
##D Z <- sapply(fitAG$fit, residuals, standardize = TRUE)
##D U <- pobs(Z)
##D pairs(U, gap = 0)
##D system.time(fitC <- fitCopula(tCopula(dim = d, dispstr = "un"), data = U,
##D                               method = "mpl"))
##D 
##D ## Simulate (standardized) Z
##D set.seed(271)
##D U. <- rCopula(n, fitC@copula) # simulate from the fitted copula
##D nu <- sapply(1:d, function(j) fitAG$fit[[j]]@fit$coef["shape"]) # extract (fitted) d.o.f. nu
##D Z. <- sapply(1:d, function(j) sqrt((nu[j]-2)/nu[j]) * qt(U.[,j], df = nu[j])) # Z
##D 
##D ## Simulate from fitted model
##D X. <- sapply(1:d, function(j)
##D     fitted(ugarchsim(fitAG$fit[[j]], n.sim = n, m.sim = 1, startMethod = "sample",
##D                      rseed = 271, custom.dist = list(name = "sample",
##D                                                      distfit = Z.[,j, drop = FALSE]))))
##D 
##D ## Plots original vs simulated -log-returns
##D opar <- par(no.readonly = TRUE)
##D layout(matrix(1:(2*d), ncol = d)) # layout
##D ran <- range(X, X.)
##D for(j in 1:d) {
##D     plot(X[,j],  type = "l", ylim = ran, ylab = paste(stocks[j], "-log-returns"))
##D     plot(X.[,j], type = "l", ylim = ran, ylab = "Simulated -log-returns")
##D }
##D     par(opar)
## End(Not run)



