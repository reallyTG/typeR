library(kergp)


### Name: kergp-package
### Title: Gaussian Process Laboratory
### Aliases: kergp-package kergp

### ** Examples

## ------------------------------------------------------------------
## Gaussian process modelling of function with invariance properties, 
## by using an argumentwise invariant kernel
## ------------------------------------------------------------------

## -- define manually an argumentwise invariant kernel --

kernFun <- function(x1, x2, par) {
  h <- (abs(x1) - abs(x2)) / par[1]
  S <- sum(h^2)
  d2 <- exp(-S)
  K <- par[2] * d2
  d1 <- 2 * K * S / par[1]   
  attr(K, "gradient") <- c(theta = d1,  sigma2 = d2)
  return(K)
}

## ---------------------------------------------------------------
## quicker: with Rcpp; see also an example  with package inline
## in "gp" doc. file. Note that the Rcpp "sugar" fucntions are
## vectorized, so no for loops is required.
## ---------------------------------------------------------------

## Not run: 
##D 
##D     cppFunction('
##D         NumericVector cppKernFun(NumericVector x1, NumericVector x2, 
##D                                  NumericVector par){
##D         int n1 = x1.size();
##D         double S, d1, d2; 
##D         NumericVector K(1), h(n1);
##D         h = (abs(x1) - abs(x2)) / par[0];  // sugar function "abs"
##D         S = sum(h * h);                    // sugar "*" and "sum" 
##D         d2 = exp(-S);
##D         K[0] = par[1] * d2;
##D         d1 = 2 * K[0] * S / par[0];   
##D         K.attr("gradient") = NumericVector::create(Named("theta", d1),
##D                                                    Named("sigma2", d2));
##D         return K;
##D      }')
##D 
## End(Not run)

## ---------------------------------------------------------------
## Below: with the R-based code for the kernel namely 'kernFun'.
## You can also replace 'kernFun' by 'cppKernFun' for speed.
## ---------------------------------------------------------------

covSymGauss <- covMan(kernel = kernFun,
                      hasGrad = TRUE,
                      label = "argumentwise invariant",
                      d = 2,
                      parLower = c(theta = 0.0, sigma2 = 0.0),
                      parUpper = c(theta = Inf, sigma2 = Inf),
                      parNames = c("theta", "sigma2"),
                      par = c(theta = 0.5, sigma2 = 2))

covSymGauss

## -- simulate a path from the corresponding GP --

nGrid <- 24; n <- nGrid^2; d <- 2
xGrid <- seq(from = -1, to = 1, length.out = nGrid)
Xgrid <- expand.grid(x1 = xGrid, x2 = xGrid)

Kmat <- covMat(object = covSymGauss, X = Xgrid,
               compGrad = FALSE, index = 1L)

library(MASS)
set.seed(1)
ygrid <- mvrnorm(mu = rep(0, n), Sigma = Kmat)

## -- extract a design and the corr. response from the grid --

nDesign <- 25
tab <- subset(cbind(Xgrid, ygrid), x1 > 0 & x2 > 0)
rowIndex <- seq(1, nrow(tab), length = nDesign)
X <- tab[rowIndex, 1:2]
y <- tab[rowIndex, 3]

opar <- par(mfrow = c(1, 3))
contour(x = xGrid, y = xGrid,
        z = matrix(ygrid, nrow = nGrid, ncol = nGrid), 
        nlevels = 15)
abline(h = 0, v = 0, col = "SpringGreen3")
points(x2 ~ x1, data = X, type = "p", pch = 21,
       col = "orangered", bg = "yellow", cex = 0.8)
title("GRF Simulation")


## -- Fit the Gaussian process model (trend + covariance parameters) -- 
covSymGauss
symgp <- gp(formula = y ~ 1, data = data.frame(y, X),
            inputs = names(X),
            cov = covSymGauss,
            parCovIni = c(0.1, 2),
            varNoiseIni = 1.0e-8,
            varNoiseLower = 0.9e-8, varNoiseUpper = 1.1e-8)

# mind that the noise is not a symmetric kernel
# so varNoiseUpper should be chosen as small as possible.

summary(symgp)

## -- predict and compare --

predSymgp <- predict(object = symgp, newdata = Xgrid, type = "UK")

contour(x = xGrid, y = xGrid,
        z = matrix(predSymgp$mean, nrow = nGrid, ncol = nGrid),
        nlevels = 15)
abline(h = 0, v = 0, col = "SpringGreen3")
points(x2 ~ x1, data = X, type = "p", pch = 21,
       col = "orangered", bg = "yellow", cex = 0.8)
title("Kriging mean")

contour(x = xGrid, y = xGrid,
        z = matrix(predSymgp$sd, nrow = nGrid, ncol = nGrid),
        nlevels = 15)
abline(h = 0, v = 0, col = "SpringGreen3")
points(x2 ~ x1, data = X, type = "p", pch = 21,
       col = "orangered", bg = "yellow", cex = 0.8)
title("Kriging s.d.")

par(opar)



