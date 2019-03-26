# Copyright (C) 2017 Markus Baaske. All Rights Reserved.
# This code is published under the L-GPL.
#
# File: 	test_covar.R
# Date:  	12/04/2017
# Author: 	Markus Baaske
# 
# Testing REML estimation 

library(qle)
data(normal)

# show default reml optimization controls (see also package nloptr)
attr(qsd,"opts")

# first covariance model
covT <- qsd$covT[1]

# sampled parameters
X <- as.matrix(qsd$qldata[1:2])

# 1st statistic
T <- qsd$qldata[c("mean.T1")]

# reml estimation
fit <- fitCov(covT,X,T,verbose=TRUE)[[1]]

# reml value at fitted parameters
p <- attr(fit,"optres")$solution

(valp <- reml(covT,p,T,X))
(obj <- attr(fit,"optres")$objective)
stopifnot(valp == obj)

# get reml function value for the first covariance model
# at other parameters, e.g.,
p <- c(0.001,1.8,1e-5)
reml(qsd$covT[1],p,qsd$qldata[c("mean.T1")],X)

# and same for second covariance model
reml(qsd$covT[2],p,qsd$qldata[c("mean.T2")],X)
