library(kergp)


### Name: covMan
### Title: Creator Function for 'covMan' Objects
### Aliases: covMan

### ** Examples

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
      hasGrad = TRUE,    
      d = 1,
      label = "myGauss",
      parLower = c(theta = 0.0, sigma2 = 0.0),
      parUpper = c(theta = Inf, sigma2 = Inf),
      parNames = c("theta", "sigma2"),
      par = c(NA, NA)
      )
      
# Let us now code the same kernel in C
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
     
myCovMan  

## "inline" the C function into an R function: much more efficient! 

## Not run: 
##D require(inline)
##D kernC <- cfunction(sig = signature(x1 = "numeric", x2 = "numeric",
##D                                    par = "numeric"),
##D                     body = kernCode)
##D myCovMan <- covMan(kernel = kernC, hasGrad = TRUE, d = 1,
##D                    parNames = c("theta", "sigma2"))
##D myCovMan
## End(Not run)

## A kernel admitting matricial arguments
myCov <- covMan(
    
    kernel = function(x1, x2, par) { 
      # x1 : matrix of size n1xd
      # x2 : matrix of size n2xd
            
      d <- ncol(x1)
            
      SS2 <- 0
      for (j in 1:d){
        Aj <- outer(x1[, j], x2[, j], "-")
        Aj2 <- Aj^2
        SS2 <- SS2 + Aj2 / par[j]^2
      }
      D2 <- exp(-SS2)
      kern <- par[d + 1] * D2
    },
    acceptMatrix = TRUE,
    d = 2,
    label = "myGauss",
    parLower = c(theta1 = 0.0, theta2 = 0.0, sigma2 = 0.0),
    parUpper = c(theta1 = Inf, theta2 = Inf, sigma2 = Inf),
    parNames = c("theta1", "theta2", "sigma2"),
    par = c(NA, NA, NA)

)
      
coef(myCov) <- c(0.5, 1, 4)
show(myCov)

## computing the covariance kernel between two points
X <- matrix(c(0, 0), ncol = 2)
Xnew <- matrix(c(0.5, 1), ncol = 2)
colnames(X) <- colnames(Xnew) <- inputNames(myCov)
covMat(myCov, X)            ## same points
covMat(myCov, X, Xnew)      ## two different points

# computing covariances between sets of given locations
X <- matrix(c(0, 0.5, 0.7, 0, 0.5, 1), ncol = 2)
t <- seq(0, 1, length.out = 3)
Xnew <- as.matrix(expand.grid(t, t))
colnames(X) <- colnames(Xnew) <- inputNames(myCov)
covMat(myCov, X)         ## covariance matrix
covMat(myCov, X, Xnew)   ## covariances between design and new data




