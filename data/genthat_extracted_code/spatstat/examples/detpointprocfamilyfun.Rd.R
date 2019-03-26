library(spatstat)


### Name: detpointprocfamilyfun
### Title: Construct a New Determinantal Point Process Model Family
###   Function
### Aliases: detpointprocfamilyfun
### Keywords: spatial models

### ** Examples

  ## Example of how to define the Gauss family
exGauss <- detpointprocfamilyfun(
    name="Gaussian",
    kernel=function(x, lambda, alpha, d){
        lambda*exp(-(x/alpha)^2)
    },
    specden=function(x, lambda, alpha, d){
        lambda * (sqrt(pi)*alpha)^d * exp(-(x*alpha*pi)^2)
    },
    convkernel=function(x, k, lambda, alpha, d){
        logres <- k*log(lambda*pi*alpha^2) - log(pi*k*alpha^2) - x^2/(k*alpha^2)
        return(exp(logres))
    },
    Kfun = function(x, lambda, alpha, d){
        pi*x^2 - pi*alpha^2/2*(1-exp(-2*x^2/alpha^2))
    },
    valid=function(lambda, alpha, d){
        lambda>0 && alpha>0 && d>=1 && lambda <= (sqrt(pi)*alpha)^(-d)
    },
    isotropic=TRUE,
    intensity="lambda",
    dim="d",
    range=function(alpha, bound = .99){
        if(missing(alpha))
            stop("The parameter alpha is missing.")
        if(!(is.numeric(bound)&&bound>0&&bound<1))
            stop("Argument bound must be a numeric between 0 and 1.")
        return(alpha*sqrt(-log(sqrt(1-bound))))
    },
    parbounds=function(name, lambda, alpha, d){
        switch(name,
               lambda = c(0, (sqrt(pi)*alpha)^(-d)),
               alpha = c(0, lambda^(-1/d)/sqrt(pi)),
               stop("Parameter name misspecified")
               )
    },
    startpar=function(model, X){
        rslt <- NULL
        if("lambda" %in% model$freepar){
            lambda <- intensity(X)
            rslt <- c(rslt, "lambda" = lambda)
            model <- update(model, lambda=lambda)
        }
        if("alpha" %in% model$freepar){
            alpha <- .8*dppparbounds(model, "alpha")[2]
            rslt <- c(rslt, "alpha" = alpha)
        }
        return(rslt)
    }
    )
  exGauss
  m <- exGauss(lambda=100, alpha=.05, d=2)
  m



