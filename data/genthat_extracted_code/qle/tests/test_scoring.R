# Copyright (C) 2017 Markus Baaske. All Rights Reserved.
# This code is published under the L-GPL.
#
# File: 	test_scoring.R
# Date:  	12/04/2017
# Author: 	Markus Baaske
# 
# Testing quasi Fisher-scoring iteration

library(qle)
data(normal)

qsd$var.type <- "cholMean"

(S <- qscoring(qsd,
  x0=c("mu"=3.5,"sigma"=1.5), 
  opts=list("pl"=10,
		    "xscale"=c(1,1), "fscale"=c(1,1),
			"grad_tol"=1e-10,"score_tol"=1e-10),
 verbose=TRUE))

# monitor is 1/2 norm^2 of quasi-score 
S$Qnorm
# quasi-devicance
S$value

# quasi-devicance at solution
D <- quasiDeviance(S$par,qsd)[[1]]
D$value 

# use alternative optimizer
S2 <- searchMinimizer(c(3.5,1.5),qsd,
		method=c("bobyqa"),verbose=TRUE)

S2$Qnorm