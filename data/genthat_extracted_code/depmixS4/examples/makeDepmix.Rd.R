library(depmixS4)


### Name: makeDepmix
### Title: Dependent Mixture Model Specifiction: full control and adding
###   response models
### Aliases: makeDepmix makeMix
### Keywords: methods

### ** Examples


# below example recreates the same model as on the fit help page in a roundabout way
# there we had:
# mod1 <- depmix(list(rt~1,corr~1),data=speed,transition=~Pacc,nstates=2,
#	 family=list(gaussian(),multinomial("identity")),ntimes=c(168,134,137))

data(speed)   

rModels <- list(
	list(
		GLMresponse(formula=rt~1,data=speed,family=gaussian()),
		GLMresponse(formula=corr~1,data=speed,family=multinomial("identity"))
	),
	list(
		GLMresponse(formula=rt~1,data=speed,family=gaussian()),
		GLMresponse(formula=corr~1,data=speed,family=multinomial("identity"))
	)
)

transition <- list()
transition[[1]] <- transInit(~Pacc,nstates=2,data=speed)
transition[[2]] <- transInit(~Pacc,nstates=2,data=speed)

inMod <- transInit(~1,ns=2,data=data.frame(rep(1,3)),family=multinomial("identity"))
mod <- makeDepmix(response=rModels,transition=transition,prior=inMod,
ntimes=c(168,134,137),homogeneous=FALSE)

set.seed(3)
fm1 <- fit(mod)
fm1
summary(fm1)


# generate data from two different multivariate normal distributions
m1 <- c(0,1)
sd1 <- matrix(c(1,0.7,.7,1),2,2)
m2 <- c(1,0)
sd2 <- matrix(c(2,.1,.1,1),2,2)
set.seed(2)
y1 <- mvrnorm(50,m1,sd1)
y2 <- mvrnorm(50,m2,sd2)
# this creates data with a single change point
y <- rbind(y1,y2)

# now use makeDepmix to create a depmix model for this bivariate normal timeseries
rModels <-  list()
rModels[[1]] <- list(MVNresponse(y~1))
rModels[[2]] <- list(MVNresponse(y~1))

trstart=c(0.9,0.1,0.1,0.9)

transition <- list()
transition[[1]] <- transInit(~1,nstates=2,data=data.frame(1),pstart=c(trstart[1:2]))
transition[[2]] <- transInit(~1,nstates=2,data=data.frame(1),pstart=c(trstart[3:4]))

instart=runif(2)
inMod <- transInit(~1,ns=2,ps=instart,data=data.frame(1))

mod <- makeDepmix(response=rModels,transition=transition,prior=inMod)

fm2 <- fit(mod,emc=em.control(random=FALSE))

# where is the switch point?
plot(as.ts(posterior(fm2)[,2]))


# in below example we add the exgaus distribution as a response model and fit
# this instead of the gaussian distribution to the rt slot of the speed data
# most of the actual computations for the exgaus distribution is done by calling
# functions from the gamlss family of packages; see their help pages for 
# interpretation of the mu, nu and sigma parameters that are fitted below

## Not run: 
##D require(gamlss)
##D require(gamlss.dist)
##D 
##D data(speed)
##D rt <- speed$rt
##D 
##D # define a response class which only contains the standard slots, no additional slots
##D setClass("exgaus", contains="response")
##D 
##D # define a generic for the method defining the response class
##D 
##D setGeneric("exgaus", function(y, pstart = NULL, fixed = NULL, ...) standardGeneric("exgaus"))
##D 
##D # define the method that creates the response class
##D 
##D setMethod("exgaus", 
##D     signature(y="ANY"), 
##D     function(y,pstart=NULL,fixed=NULL, ...) {
##D         y <- matrix(y,length(y))
##D 		x <- matrix(1)
##D 		parameters <- list()
##D 		npar <- 3
##D 		if(is.null(fixed)) fixed <- as.logical(rep(0,npar))
##D 		if(!is.null(pstart)) {
##D 		if(length(pstart)!=npar) stop("length of 'pstart' must be ",npar)
##D 		  parameters$mu <- pstart[1]
##D 		  parameters$sigma <- log(pstart[2])
##D 		  parameters$nu <- log(pstart[3])
##D         }
##D         mod <- new("exgaus",parameters=parameters,fixed=fixed,x=x,y=y,npar=npar)
##D         mod
##D 	}
##D )
##D 
##D setMethod("show","exgaus",
##D     function(object) {
##D         cat("Model of type exgaus (see ?gamlss for details) \n")
##D         cat("Parameters: \n")
##D         cat("mu: ", object@parameters$mu, "\n")
##D         cat("sigma: ", object@parameters$sigma, "\n")
##D         cat("nu: ", object@parameters$nu, "\n")
##D     }
##D )
##D 
##D setMethod("dens","exgaus",
##D  function(object,log=FALSE) {
##D    dexGAUS(object@y, mu = predict(object), 
##D 		sigma = exp(object@parameters$sigma), nu = exp(object@parameters$nu), log = log)
##D   }
##D )
##D 
##D setMethod("getpars","response",
##D     function(object,which="pars",...) {
##D         switch(which,
##D             "pars" = {
##D                 parameters <- numeric()
##D                 parameters <- unlist(object@parameters)
##D                 pars <- parameters
##D             },
##D             "fixed" = {
##D                 pars <- object@fixed
##D             }
##D         )
##D         return(pars)
##D     }
##D )
##D 
##D setMethod("setpars","exgaus",
##D     function(object, values, which="pars", ...) {
##D         npar <- npar(object)
##D         if(length(values)!=npar) stop("length of 'values' must be",npar)
##D         # determine whether parameters or fixed constraints are being set
##D 		nms <- names(object@parameters)
##D 		switch(which,
##D 		  "pars"= {
##D 		      object@parameters$mu <- values[1]
##D 		      object@parameters$sigma <- values[2]
##D 		      object@parameters$nu <- values[3]
##D 		      },
##D 		  "fixed" = {
##D 		      object@fixed <- as.logical(values)
##D 		  }
##D 		  )
##D         names(object@parameters) <- nms
##D         return(object)
##D     }
##D )
##D 
##D setMethod("fit","exgaus",
##D     function(object,w) {
##D         if(missing(w)) w <- NULL
##D         y <- object@y
##D         fit <- gamlss(y~1,weights=w,family=exGAUS(),
##D 			control=gamlss.control(n.cyc=100,trace=FALSE),
##D 			mu.start=object@parameters$mu,
##D 			sigma.start=exp(object@parameters$sigma),
##D 			nu.start=exp(object@parameters$nu))
##D 		pars <- c(fit$mu.coefficients,fit$sigma.coefficients,fit$nu.coefficients)
##D 		object <- setpars(object,pars)
##D 		object
##D 	}
##D )
##D 
##D setMethod("predict","exgaus", 
##D     function(object) {
##D         ret <- object@parameters$mu
##D         return(ret)
##D     }
##D )
##D 
##D rModels <- list(
##D   list(
##D 	  exgaus(rt,pstart=c(5,.1,.1)),
##D 		GLMresponse(formula=corr~1, data=speed, 
##D 		family=multinomial("identity"), pstart=c(0.5,0.5))
##D 	),
##D 	list(
##D 		exgaus(rt,pstart=c(6,.1,.1)),
##D 		GLMresponse(formula=corr~1, data=speed, 
##D 		family=multinomial("identity"), pstart=c(.1,.9))
##D 	)
##D )
##D 
##D trstart=c(0.9,0.1,0.1,0.9)
##D transition <- list()
##D transition[[1]] <- transInit(~Pacc,nstates=2,data=speed,pstart=c(trstart[1:2],0,0))
##D transition[[2]] <- transInit(~Pacc,nstates=2,data=speed,pstart=c(trstart[3:4],0,0))
##D 
##D instart=c(0.5,0.5)
##D inMod <- transInit(~1,ns=2,ps=instart,family=multinomial("identity"), data=data.frame(rep(1,3)))
##D 
##D mod <- makeDepmix(response=rModels,transition=transition,prior=inMod,ntimes=c(168,134,137), 
##D homogeneous=FALSE)
##D 
##D fm3 <- fit(mod,emc=em.control(rand=FALSE))
##D summary(fm3)
## End(Not run)




