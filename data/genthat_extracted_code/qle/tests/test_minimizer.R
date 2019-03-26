# Copyright (C) 2017 Markus Baaske. All Rights Reserved.
# This code is published under the L-GPL.
#
# File: 	test_minimizer.R
# Date:  	12/04/2017
# Author: 	Markus Baaske
# 
# Test the criterion function minimization

library(qle)
data(normal)

# local root finding
searchMinimizer(c(2.5,1.5),qsd,W=diag(2),theta=c(2,1),method=c("qscoring","bobyqa"),verbose=TRUE) 

