# Copyright (C) 2017 Markus Baaske. All Rights Reserved.
# This code is published under the L-GPL.
#
# File: 	test_mahal.R
# Date:  	12/04/2017
# Author: 	Markus Baaske
# 
# 	Test Mahalanobis distance with weighting matrix  
#	and average approximation of variance matrix

library(qle)
data(normal)

# these options are usually
# set when constructing the
# QL data object `qsd`
qsd$var.type <- "cholMean"
qsd$criterion <- "mahal"

# some parameters
theta <- c("mu"=2,"sigma"=0.95) 

# criterion function values
MD <- mahalDist(theta,qsd)
QD <- quasiDeviance(theta,qsd)

# must be equal due to the same
# number of parameters and statistics
all.equal(MD[[1]]$value,QD[[1]]$value)

# least-squares (constant variance)
mahalDist(theta,qsd,Sigma=diag(2))
