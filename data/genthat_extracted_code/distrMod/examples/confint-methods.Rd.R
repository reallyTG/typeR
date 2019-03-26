library(distrMod)


### Name: confint-methods
### Title: Methods for function confint in Package 'distrMod'
### Aliases: confint-methods confint confint,ANY,missing-method
###   confint,Estimate,missing-method confint,mle,missing-method
###   confint,profile.mle,missing-method
### Keywords: models

### ** Examples

## for signature ANY examples confer stats::confint
## (empirical) Data
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2)

## Maximum likelihood estimator
res <- MLEstimator(x = x, ParamFamily = G)
confint(res)

### for comparison:
require(MASS)
(res1 <- fitdistr(x, "gamma"))
## add a convenient (albeit wrong)
## S3-method for vcov:
## --- wrong as in general cov-matrix
##     will not be diagonal
## but for conf-interval this does
## not matter...
vcov.fitdistr <- function(object, ...){
     v<-diag(object$sd^2)
     rownames(v) <- colnames(v) <- names(object$estimate) 
     v}

## explicitely transforming to
## MASS parametrization:
mtrafo <- function(x){
     nms0 <- names(c(main(param(G)),nuisance(param(G))))
     nms <- c("shape","rate")
     fval0 <- c(x[2], 1/x[1])
     names(fval0) <- nms
     mat0 <- matrix( c(0, -1/x[1]^2, 1, 0), nrow = 2, ncol = 2,
                     dimnames = list(nms,nms0))                          
     list(fval = fval0, mat = mat0)}

G2 <- G
trafo(G2) <- mtrafo
res2 <- MLEstimator(x = x, ParamFamily = G2)

old<-getdistrModOption("show.details")
distrModoptions("show.details" = "minimal")
res
res1
res2
confint(res)
confint(res1)
confint(res2)
confint(res,level=0.99)
distrModoptions("show.details" = old)
 



