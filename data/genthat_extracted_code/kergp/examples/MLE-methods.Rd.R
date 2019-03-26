library(kergp)


### Name: mle-methods
### Title: Maximum Likelihood Estimation of Gaussian Process Model
###   Parameters
### Aliases: mle,covAll-method mle-methods

### ** Examples


set.seed(29770)

##=======================================================================
## Example. A 4-dimensional "covMan" kernel
##=======================================================================
d <- 4
myCovMan <- 
      covMan(
         kernel = function(x1, x2, par) { 
         htilde <- (x1 - x2) / par[1]
         SS2 <- sum(htilde^2)
         d2 <- exp(-SS2)
         kern <- par[2] * d2
         d1 <- 2 * kern * SS2 / par[1]            
         attr(kern, "gradient") <- c(theta = d1,  sigma2 = d2)
         return(kern)
      },
      label = "myGauss",
      hasGrad = TRUE,
      d = 4,    
      parLower = c(theta = 0.0, sigma2 = 0.0),
      parUpper = c(theta = +Inf, sigma2 = +Inf),
      parNames = c("theta", "sigma2"),
      par = c(NA, NA)
      )
kernCode <- "
       SEXP kern, dkern;
       int nprotect = 0, d;
       double SS2 = 0.0, d2, z, *rkern, *rdkern;

       d = LENGTH(x1);
       PROTECT(kern = allocVector(REALSXP, 1)); nprotect++;
       PROTECT(dkern = allocVector(REALSXP, 2)); nprotect++;
       rkern = REAL(kern);
       rdkern = REAL(dkern);

       for (int i = 0; i < d; i++) {
         z = ( REAL(x1)[i] - REAL(x2)[i] ) / REAL(par)[0];
         SS2 += z * z; 
       }

       d2 = exp(-SS2);
       rkern[0] = REAL(par)[1] * d2;
       rdkern[1] =  d2; 
       rdkern[0] =  2 * rkern[0] * SS2 / REAL(par)[0];

       SET_ATTR(kern, install(\"gradient\"), dkern);
       UNPROTECT(nprotect);
       return kern;
     "

## inline the C function into an R function: MUCH MORE EFFICIENT!!!
## Not run: 
##D require(inline)
##D kernC <- cfunction(sig = signature(x1 = "numeric", x2 = "numeric",
##D                                    par = "numeric"),
##D                     body = kernCode)
##D myCovMan <- covMan(kernel = kernC, hasGrad = TRUE, label = "myGauss", d = 4,
##D                    parNames = c("theta", "sigma2"),
##D                    parLower = c("theta" = 0.0, "sigma2" = 0.0),
##D                    parUpper = c("theta" = Inf, "sigma2" = Inf))
## End(Not run)

##=======================================================================
## Example (continued). Simulate data for covMan and trend
##=======================================================================
n <- 100; 
X <- matrix(runif(n * d), nrow = n)
colnames(X) <- inputNames(myCovMan)

coef(myCovMan) <- myPar <- c(theta = 0.5, sigma2 = 2)
C <- covMat(object = myCovMan, X = X,
            compGrad = FALSE,  index = 1L)

library(MASS)
set.seed(456)
y <- mvrnorm(mu = rep(0, n), Sigma = C)
p <- rpois(1, lambda = 4)
if (p > 0) {
  F <- matrix(runif(n * p), nrow = n, ncol = p)
  beta <- rnorm(p)
  y <- F %*% beta + y
} else F <- NULL
par <- parCovIni <- c("theta" = 0.6, "sigma2" = 4)

##=======================================================================
## Example (continued). ML estimation. Note the 'partrack' argument
##=======================================================================           
est <- mle(object = myCovMan,
           parCovIni = parCovIni,
           y = y, X = X, F = F,
           parCovLower = c(0.05, 0.05), parCovUpper = c(10, 100),
           parTrack = TRUE, noise = FALSE, checkNames = FALSE)
est$opt$value

## change the (constrained) optimization  method
## Not run: 
##D est1 <- mle(object = myCovMan,
##D             parCovIni = parCovIni,
##D             optimFun = "stats::optim",
##D             optimMethod = "L-BFGS-B",
##D             y = y, X = X, F = F,
##D             parCovLower = c(0.05, 0.05), parCovUpper = c(10, 100),
##D             parTrack = TRUE, noise = FALSE, checkNames = FALSE)
##D est1$opt$value
## End(Not run)

##=======================================================================
## Example (continued). Grid for graphical analysis
##=======================================================================
## Not run: 
##D     theta.grid <- seq(from = 0.1, to = 0.7, by = 0.2)
##D     sigma2.grid <- seq(from = 0.3, to = 6, by = 0.4)
##D     par.grid <- expand.grid(theta = theta.grid, sigma2 = sigma2.grid)
##D     ll <- apply(as.matrix(par.grid), 1, est$logLikFun)
##D     llmat <- matrix(ll, nrow = length(theta.grid),
##D                     ncol = length(sigma2.grid))
## End(Not run)                

##=======================================================================
## Example (continued). Explore the surface ?
##=======================================================================
## Not run: 
##D    require(rgl)
##D    persp3d(x = theta.grid, y = sigma2.grid, z = ll,
##D            xlab = "theta", ylab = "sigma2", zlab = "logLik",
##D            col = "SpringGreen3", alpha = 0.6)
## End(Not run)

##=======================================================================
## Example (continued). Draw a contour plot for the log-lik 
##                        and show iterates
##=======================================================================
## Not run: 
##D     contour(x = theta.grid, y = sigma2.grid, z = llmat,
##D             col = "SpringGreen3", xlab = "theta", ylab = "sigma2",
##D             main = "log-likelihood contours and iterates",
##D             xlim = range(theta.grid, est$parTracked[ , 1], na.rm = TRUE),
##D             ylim = range(sigma2.grid, est$parTracked[ , 2], na.rm = TRUE))
##D     abline(v = est$coef.kernel[1], h = est$coef.kernel[2], lty = "dotted")
##D     niter <- nrow(est$parTracked)
##D     points(est$parTracked[1:niter-1, ],
##D            col = "orangered", bg = "yellow", pch = 21, lwd = 2, type = "o")
##D     points(est$parTracked[niter, , drop = FALSE],
##D            col = "blue", bg = "blue", pch = 21, lwd = 2, type = "o", cex = 1.5)
##D     ann <- seq(from = 1, to = niter, by = 5)
##D     text(x = est$parTracked[ann, 1], y = est$parTracked[ann, 2],
##D          labels = ann - 1L, pos = 4, cex = 0.8, col = "orangered")
##D     points(x = myPar["theta"], y = myPar["sigma2"],
##D            bg = "Chartreuse3", col = "ForestGreen",
##D            pch = 22, lwd = 2, cex = 1.4)
##D 
##D     legend("topright", legend = c("optim", "optim (last)", "true"),
##D            pch = c(21, 21, 22), lwd = c(2, 2, 2), lty = c(1, 1, NA),
##D            col = c("orangered", "blue", "ForestGreen"),
##D            pt.bg = c("yellow", "blue", "Chartreuse3"))
##D  
## End(Not run)



