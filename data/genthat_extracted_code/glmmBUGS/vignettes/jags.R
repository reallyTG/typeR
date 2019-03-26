### R code from vignette source 'jags.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
library('glmmBUGS')
haveR2jags = require('R2jags', quietly=TRUE)  
print(haveR2jags)
haveRjags = requireNamespace('rjags', quietly=TRUE)
print(haveRjags)
haveRjags = try(
		loadNamespace('rjags'),
  	silent=TRUE)
if(class(haveRjags) == 'try-error') {
	haveR2jags = FALSE
}


###################################################
### code chunk number 2: loadDataM
###################################################
data('Muscle', package='nlme')


###################################################
### code chunk number 3: glmmbugsM
###################################################
muscleRagged = glmmBUGS(conc ~ length, data=Muscle, 
	effects="Strip", family="gaussian",
	modelFile='model.bug', reparam='Strip')
startingValues = muscleRagged$startingValues


###################################################
### code chunk number 4: jagsM
###################################################
source("getInits.R")
if(haveR2jags) {
	muscleResult = jags(
	  muscleRagged$ragged, getInits, 
	  parameters.to.save = names(getInits()),
      model.file="model.bug", n.chain=3, n.iter=1000, 
      n.burnin=100, n.thin=10, refresh=200,
      working.directory=getwd()) 
} else {
	muscleResult = NULL
}


###################################################
### code chunk number 5: restoreParamsM
###################################################
if(!is.null(muscleResult)) {
	muscleParams = restoreParams(
	muscleResult$BUGSoutput, 
	muscleRagged$ragged) 
summaryChain(muscleParams)$scalars[,c('mean','2.5pct','97.5pct')]
}


###################################################
### code chunk number 6: checkChainM
###################################################
if(!is.null(muscleResult)) {
	checkChain(muscleParams)
} else {
	plot(1, main='Not run, some packages missing')
}


###################################################
### code chunk number 7: formatData
###################################################
data('bacteria', package='MASS')
bacterianew <- bacteria
bacterianew$yInt = as.integer(bacterianew$y == "y")
levels(bacterianew$trt) <- c("placebo", "drug", "drugplus")


###################################################
### code chunk number 8: glmmBUGS
###################################################
bacrag <- glmmBUGS(formula = yInt ~ trt + week, 
    data = bacterianew,
    effects = "ID", modelFile = "bacteria.txt",
    family = "bernoulli",brugs=TRUE)

source("getInits.R")
startingValues = bacrag$startingValues


###################################################
### code chunk number 9: runjags
###################################################
if(haveR2jags) {
  bacResult = R2jags::jags(bacrag$ragged, 
      inits=getInits,
      model.file = "bacteria.txt", n.chain = 3,
      n.iter = 600, n.burnin = 10, refresh=200,
      parameters = names(getInits()),
      n.thin = 4)
} else {
	bacResult = NULL
}


###################################################
### code chunk number 10: postprocess
###################################################
if(!is.null(bacResult)) {
bacParams = restoreParams(bacResult$BUGSoutput,
     bacrag$ragged)
}


###################################################
### code chunk number 11: results
###################################################
if(!is.null(bacResult)) {
	bacsummary = summaryChain(bacParams)
	bacsummary$betas[,c('mean', 'sd')]
}


###################################################
### code chunk number 12: checkChain
###################################################
if(!is.null(bacResult)) {
	checkChain(bacParams, c("intercept", "SDID"),oneFigure=TRUE)
} else {
	plot(1, main='Not run, some packages missing')
}


