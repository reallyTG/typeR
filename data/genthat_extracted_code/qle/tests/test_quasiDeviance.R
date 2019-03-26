# Copyright (C) 2017 Markus Baaske. All Rights Reserved.
# This code is published under the L-GPL.
#
# File: 	test_quasiDeviance.R
# Date:  	27/07/2017
# Author: 	Markus Baaske
# 
# Testing quasi-deviance return values
# Shows how quasi-score, quasi-deviance, variances are computed

library(qle)
data(normal)

# design, statistics, predictions
x0 <- c("mu"=2,"sigma"=1)
Xs <- as.matrix(qsd$qldata[c(1,2)])
Tstat <- qsd$qldata[c(3,4)]
pred <- estim(qsd$covT,x0,Xs,Tstat,krig.type="var")[[1]]
pred2 <- estim(qsd$covT,x0,Xs,Tstat,krig.type="dual")[[1]]

# compute quasi-deviance with use of kriging variances
D <- quasiDeviance(x0,qsd,verbose=TRUE)[[1]]
# and without use of kriging variances,
# then no modified QD can be computed including no variances
# of the quasi-score vector
qsd$krig.type <- "dual"
Ds <- quasiDeviance(x0,qsd,verbose=TRUE)[[1]]
# and reset
qsd$krig.type <- "var"

# quasi-score
S <- attr(D,"Sigma")
invS <- solve(S)
B <- D$jac%*%invS

# prediction variances
# of sample mean of statistic Z=E[T(X)]
stopifnot(D$sig2==pred$sigma2)
D$score
t(qs <- B%*%(qsd$obs-pred$mean))

# quasi-information
D$I
B%*%S%*%t(B)

# variance quasi-score vector
D$varS
(C <- B%*%diag(D$sig2)%*%t(B))

# variance matrix of statistics Var(T(X))
print(S)
covarTx(qsd,theta=x0,useVar=TRUE)

# value quasi-deviance
D$value
t(qs)%*%solve(D$I)%*%qs

# modified quasi-information: Mahalanobis distance of quasi-score
D$qval
t(qs)%*%solve(C)%*%qs
