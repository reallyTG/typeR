library(kergp)


### Name: gp
### Title: Gaussian Process Model
### Aliases: gp

### ** Examples

## ==================================================================
## Example 1. Data sampled from a GP model with a known covTS object
## ==================================================================
set.seed(1234)
myCov <- covTS(inputs = c("Temp", "Humid"),
               kernel = "k1Matern5_2",
               dep = c(range = "input"),
               value = c(range = 0.4))
## change coefficients (variances)
coef(myCov) <- c(0.5, 0.8, 2, 16)
d <- myCov@d; n <- 20
## design matrix
X <- matrix(runif(n*d), nrow = n, ncol = d)
colnames(X) <- inputNames(myCov)
## generate the GP realization
myGp <- gp(formula = y ~ 1, data = data.frame(y = rep(0, n), X), 
            cov = myCov, estim = FALSE,
            beta = 10, varNoise = 0.05)
y <- simulate(myGp, cond = FALSE)$sim

## parIni: add noise to true parameters
parCovIni <- coef(myCov)
parCovIni[] <- 0.9 * parCovIni[] +  0.1 * runif(length(parCovIni))
coefLower(myCov) <- rep(1e-2, 4)
coefUpper(myCov) <- c(5, 5, 20, 20)
est <- gp(y ~ 1, data = data.frame(y = y, X),
          cov = myCov, 
          noise = TRUE,
          varNoiseLower = 1e-2,
          varNoiseIni = 1.0,
          parCovIni = parCovIni) 
summary(est)
coef(est)

## =======================================================================
## Example 2. Predicting an additive function with an additive GP model
## =======================================================================

## Not run: 
##D     
##D     addfun6d <- function(x){
##D        res <- x[1]^3 + cos(pi * x[2]) + abs(x[3]) * sin(x[3]^2) +
##D            3 * x[4]^3 + 3 * cos(pi * x[5]) + 3 * abs(x[6]) * sin(x[6]^2)
##D     }
##D 
##D     ## 'Fit' is for the learning set, 'Val' for the validation set
##D     set.seed(123)
##D     nFit <- 50   
##D     nVal <- 200
##D     d <- 6 
##D     inputs <- paste("x", 1L:d, sep = "")
##D 
##D     ## create design matrices with DiceDesign package 
##D     require(DiceDesign)
##D     require(DiceKriging)
##D     set.seed(0)
##D     dataFitIni <- DiceDesign::lhsDesign(nFit, d)$design 
##D     dataValIni <- DiceDesign::lhsDesign(nVal, d)$design 
##D     dataFit <- DiceDesign::maximinSA_LHS(dataFitIni)$design
##D     dataVal <- DiceDesign::maximinSA_LHS(dataValIni)$design
##D 
##D     colnames(dataFit) <- colnames(dataVal) <- inputs
##D     testfun <- addfun6d
##D     dataFit <- data.frame(dataFit, y = apply(dataFit, 1, testfun))
##D     dataVal <- data.frame(dataVal, y = apply(dataVal, 1, testfun))
##D 
##D     ## Creation of "CovTS" object with one range by input
##D     myCov <- covTS(inputs = inputs, d = d, kernel = "k1Matern3_2", 
##D                    dep = c(range = "input"))
##D 
##D     ## Creation of a gp object
##D     fitgp <- gp(formula = y ~ 1, data = dataFit, 
##D                 cov = myCov, noise = TRUE, 
##D                 parCovIni = rep(1, 2*d),
##D                 parCovLower = c(rep(1e-4, 2*d)),
##D                 parCovUpper = c(rep(5, d), rep(10,d)))
##D  
##D     predTS <- predict(fitgp, newdata = as.matrix(dataVal[ , inputs]), type = "UK")$mean
##D 
##D     ## Classical tensor product kernel as a reference for comparison
##D     fitRef <- DiceKriging::km(formula = ~1,
##D                               design = dataFit[ , inputs],
##D                               response = dataFit$y,  covtype="matern3_2")
##D     predRef <- predict(fitRef,
##D                        newdata = as.matrix(dataVal[ , inputs]),
##D                        type = "UK")$mean
##D     ## Compare TS and Ref
##D     RMSE <- data.frame(TS = sqrt(mean((dataVal$y - predTS)^2)),
##D                        Ref = sqrt(mean((dataVal$y - predRef)^2)),
##D                        row.names = "RMSE")
##D     print(RMSE)
##D 
##D     Comp <- data.frame(y = dataVal$y, predTS, predRef)
##D     plot(predRef ~ y, data = Comp, col = "black", pch = 4,
##D          xlab = "True", ylab = "Predicted",
##D          main = paste("Prediction on a validation set (nFit = ",
##D                       nFit, ", nVal = ", nVal, ").", sep = ""))
##D     points(predTS ~ y, data = Comp, col = "red", pch = 20)
##D     abline(a = 0, b = 1, col = "blue", lty = "dotted")
##D     legend("bottomright", pch = c(4, 20), col = c("black", "red"),
##D            legend = c("Ref", "Tensor Sum"))
## End(Not run)

##=======================================================================
## Example 3: a 'covMan' kernel with 3 implementations
##=======================================================================

d <- 4

## -- Define a 4-dimensional covariance structure with a kernel in R

myGaussFunR <- function(x1, x2, par) { 
    h <- (x1 - x2) / par[1]
    SS2 <- sum(h^2)
    d2 <- exp(-SS2)
    kern <- par[2] * d2
    d1 <- 2 * kern * SS2 / par[1]            
    attr(kern, "gradient") <- c(theta = d1,  sigma2 = d2)
    return(kern)
}

myGaussR <- covMan(kernel = myGaussFunR,
                   hasGrad = TRUE,
                   d = d,
                   parLower = c(theta = 0.0, sigma2 = 0.0),
                   parUpper = c(theta = Inf, sigma2 = Inf),
                   parNames = c("theta", "sigma2"),
                   label = "Gaussian kernel: R implementation")

## -- The same, still in R, but with a kernel admitting matrices as arguments

myGaussFunRVec <- function(x1, x2, par) { 
    # x1, x2 : matrices with same number of columns 'd' (dimension)
    n <- nrow(x1)
    d <- ncol(x1)     
    SS2 <- 0  
    for (j in 1:d){
        Aj <- outer(x1[ , j], x2[ , j], "-")
        Hj2 <- (Aj / par[1])^2
        SS2 <- SS2 + Hj2
    }
    D2 <- exp(-SS2)
    kern <- par[2] * D2
    D1 <- 2 * kern * SS2 / par[1] 
    attr(kern, "gradient") <- list(theta = D1,  sigma2 = D2)
  
    return(kern)
}

myGaussRVec <- covMan(
    kernel = myGaussFunRVec,
    hasGrad = TRUE,
    acceptMatrix = TRUE,
    d = d,
    parLower = c(theta = 0.0, sigma2 = 0.0),
    parUpper = c(theta = Inf, sigma2 = Inf),
    parNames = c("theta", "sigma2"),
    label = "Gaussian kernel: vectorised R implementation"
)

## -- The same, with inlined C code
## (see also another example with Rcpp by typing: ?kergp).

if (require(inline)) {

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
    myGaussFunC <- cfunction(sig = signature(x1 = "numeric", x2 = "numeric",
                                          par = "numeric"),
                             body = kernCode)

    myGaussC <- covMan(kernel = myGaussFunC,
                       hasGrad = TRUE,
                       d = d,
                       parLower = c(theta = 0.0, sigma2 = 0.0),
                       parUpper = c(theta = Inf, sigma2 = Inf),
                       parNames = c("theta", "sigma2"),
                       label = "Gaussian kernel: C/inline implementation")

}

## == Simulate data for covMan and trend ==

n <- 100; p <- d + 1
X <- matrix(runif(n * d), nrow = n)
colnames(X) <- inputNames(myGaussRVec)
design <- data.frame(X)
coef(myGaussRVec) <- myPar <- c(theta = 0.5, sigma2 = 2)
myGp <- gp(formula = y ~ 1, data = data.frame(y = rep(0, n), design), 
            cov = myGaussRVec, estim = FALSE,
            beta = 0, varNoise = 1e-8)
y <- simulate(myGp, cond = FALSE)$sim
F <- matrix(runif(n * p), nrow = n, ncol = p)
beta <- (1:p) / p
y <- tcrossprod(F, t(beta)) + y

## == ML estimation. ==
tRVec <- system.time(
    resRVec <- gp(formula = y ~ ., data = data.frame(y = y, design),
                  cov = myGaussRVec,
                  compGrad = TRUE, 
                  parCovIni = c(0.5, 0.5), varNoiseLower = 1e-4,
                  parCovLower = c(1e-5, 1e-5), parCovUpper = c(Inf, Inf))
)

summary(resRVec)
coef(resRVec)
pRVec <- predict(resRVec, newdata = design, type = "UK")    
tAll <- tRVec
coefAll <- coef(resRVec)
## compare time required by the 3 implementations
## Not run: 
##D     tR <- system.time(
##D         resR <- gp(formula = y ~ ., data = data.frame(y = y, design),
##D                    cov = myGaussR,
##D                    compGrad = TRUE, 
##D                    parCovIni = c(0.5, 0.5), varNoiseLower = 1e-4,
##D                    parCovLower = c(1e-5, 1e-5), parCovUpper = c(Inf, Inf))
##D     )
##D     tAll <- rbind(tRVec = tAll, tR)
##D     coefAll <- rbind(coefAll, coef(resR))
##D     if (require(inline)) {
##D         tC <- system.time(
##D             resC <- gp(formula = y ~ ., data = data.frame(y = y, design),
##D                        cov = myGaussC,
##D                        compGrad = TRUE, 
##D                        parCovIni = c(0.5, 0.5), varNoiseLower = 1e-4,
##D                        parCovLower = c(1e-5, 1e-5), parCovUpper = c(Inf, Inf))
##D         )
##D         tAll <- rbind(tAll, tC)
##D         coefAll <- rbind(coefAll, coef(resC))
##D     }
## End(Not run)
tAll

## rows must be identical 
coefAll




