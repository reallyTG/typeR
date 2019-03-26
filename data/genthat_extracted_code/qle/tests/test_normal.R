# Copyright (C) 2017 Markus Baaske. All Rights Reserved.
# This code is published under the L-GPL.
#
# File: 	test_scoring.R
# Date:  	12/04/2017
# Author: 	Markus Baaske
# 
# Testing the construction of the QL model for a normal distribution 

library(qle)

# define a statistical model bysimulation function
simfunc <- function(pars) {	
    x <- rnorm(10,mean=pars["mu"],sd=pars["sigma"])    
    c("T1"=median(x),"T2"=mad(x))	
}

# box contraints defining the parameter space
lb <- c("mu"=0.5,"sigma"=0.1)
ub <- c("mu"=8.0,"sigma"=5.0)	   

## the (unknown) true parameter
theta0 <- c("mu"=2,"sigma"=1)

# simulate model at a minimum of required design points
sim <- simQLdata(sim=simfunc,nsim=10,N=8,
    method="randomLHS",lb=lb,ub=ub)	 

# true and error-free observation
obs <- structure(c("T1"=2,"T2"=1), class="simQL")

# set number of simulations manually
# since otherwise only `nsim` would be used to 
# calculate sample average variance
attr(sim,"nsim") <- 100

# construct QL approximation model
qsd <- getQLmodel(sim,lb,ub,obs,var.type="wcholMean",
		model="sirfk", verbose=TRUE)

# no bootstrap since sample average approximation `wcholMean`
# of variance matrix of statistics
stopifnot(attr(qsd$qldata,"Nb") == 0)

# Optimization results (REML) for kriging statistics
lapply(qsd$covT,function(x) attr(x,"optres"))
# and parameters
t(sapply(qsd$covT,"[[","param"))

# store simulation results
qsd$sim <- sim
# and simulator
qsd$simfn <- simfunc

# store the QL model object
#save(qsd,file="normal.rda")

## fit Matern
qsd2 <- getQLmodel(sim,lb,ub,obs,
		var.type="kriging", 							# use option `kriging` the variance matrix
		var.opts=list("model"="sirfk"), intrinsic=TRUE, # with `sirfk` model (default) using bootstrap
		Nb = 100, 										# number of bootstrap samples to estimate local nugget variances  
		model="matern", verbose=TRUE) 					# `matern` model for kriging the sample means of statistics
		
# REML parameters for kriging statistics
t(sapply(qsd2$covT,"[[","param"))

# REML parameters for kriging variance matrix
t(sapply(qsd2$covL,"[[","param"))
