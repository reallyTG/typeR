library(distrMod)


### Name: trafo-methods
### Title: Methods for function trafo in Package 'distrMod'
### Aliases: trafo-methods trafo trafo,Estimate,missing-method
###   trafo,Estimate,ParamFamParameter-method
###   trafo,ParamFamParameter,missing-method
###   trafo,ParamWithScaleAndShapeFamParameter,missing-method
###   trafo,ParamFamily,missing-method
###   trafo,ParamFamily,ParamFamParameter-method trafo.fct
###   trafo.fct-methods trafo.fct,ParamFamily-method trafo<-
###   trafo<-,ParamFamParameter-method trafo<-,ParamFamily-method
### Keywords: models

### ** Examples

## Gaussian location and scale
NS <- NormLocationScaleFamily(mean=2, sd=3)
## generate data out of this situation
x <- r(distribution(NS))(30)

## want to estimate mu/sigma, sigma^2
## -> new trafo slot:
trafo(NS) <- function(param){
  mu <- param["mean"]
  sd <- param["sd"]
  fval <- c(mu/sd, sd^2)
  nfval <- c("mu/sig", "sig^2")
  names(fval) <- nfval
  mat <- matrix(c(1/sd,0,-mu/sd^2,2*sd),2,2)
  dimnames(mat) <- list(nfval,c("mean","sd"))
  return(list(fval=fval, mat=mat))
}

## Maximum likelihood estimator
(res <- MLEstimator(x = x, ParamFamily = NS))
## confidence interval
 confint(res)




