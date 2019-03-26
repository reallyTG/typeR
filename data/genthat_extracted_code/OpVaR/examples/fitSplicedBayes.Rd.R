library(OpVaR)


### Name: fitSplicedBayes
### Title: Parameter Estimation for Spliced Distributions
### Aliases: fitSplicedBayesWeibullGPD fitSplicedBayesGammaGPD
###   fitSplicedBayesLognormGPD fitSplicedBayesKDEGPD

### ** Examples

### Example for estimating the parameters of the spliced Weibull-GPD

## Not run: 
##D 
##D data("lossdat")
##D data=lossdat[[1]]$Loss
##D 
##D ## starting values - method of moments
##D 
##D # Weibull distribution (shape, scale)
##D model <- function(x) c(F1 = x[2]*gamma(1+1/x[1])-mean(data),
##D 	F2 = x[2]^2*(gamma(1+2/x[1])-(gamma(1+1/x[1]))^2)-sd(data)^2)
##D weibullpar <- rootSolve::multiroot(f = model,start = c((sd(data)/mean(data))^(-1.086),
##D 	mean(data)/(gamma(1+1/((sd(data)/mean(data))^(-1.086))))))$root
##D 
##D # generalized Pareto distribution (tresh, beta, xi)
##D thresh=quantile(data,.9) # threshold
##D data2=data[which(data>thresh)]
##D model=function(x) c(F1=thresh+x[1]/(1-x[2])-mean(data2),
##D 	F2=x[1]^2/(1-x[2])^2/(1-2*x[2])-sd(data2)^2)
##D gpdpar=c(thresh,rootSolve::multiroot(f=model,start=c(mean(data2),1/mean(data2)))$root)
##D 
##D ## parameters of the prior distribution
##D 
##D prior <- list(xi = c(gpdpar[3],sd(data)),tau = c(quantile(data,.9),sd(data)/10),
##D 	beta = c(gpdpar[2],sd(data)),wscale = c(weibullpar[2],sd(data)),
##D 	wshape = c(weibullpar[1],sd(data)))
##D 
##D ## estimation of (shape, scale, thresh, beta, xi)
##D 
##D fitSplicedBayesWeibullGPD(data, prior = prior, proposal_scale = evmix::fweibullgpd(data, 
##D 	method = "Nelder-Mead", pvector = c(weibullpar[1], weibullpar[2], gpdpar[1], 
##D 	gpdpar[2], gpdpar[3]))$se, start = evmix::fweibullgpd(data, 
##D 	method = "Nelder-Mead", pvector = c(weibullpar[1], weibullpar[2], gpdpar[1], 
##D 	gpdpar[2], gpdpar[3]))$optim$par)
## End(Not run)



