## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "##"
)

## ----chol----------------------------------------------------------------
library('CholWishart')
set.seed(20180220)
A <- stats::rWishart(1,10,5*diag(4))[,,1]
set.seed(20180220)
B <- rInvWishart(1,10,.2*diag(4))[,,1]
set.seed(20180220)
C <- rCholWishart(1,10,5*diag(4))[,,1]
set.seed(20180220)
D <- rInvCholWishart(1,10,.2*diag(4))[,,1]

## ----results-------------------------------------------------------------
A %*% B 
crossprod(C) %*% crossprod(D) # note: we do not expect C = D^-1, we expect this! 
crossprod(D) %*% A
crossprod(C) %*% B

## ----pseudo--------------------------------------------------------------
A <- rPseudoWishart(n = 1, df = 3, Sigma = diag(5))[, , 1]
A
qr(A)$rank
B <- rGenInvWishart(n = 1, df = 3, Sigma = diag(5))[, , 1]
B
qr(B)$rank

## ----density-------------------------------------------------------------
dWishart(diag(3), df = 5, 5*diag(3))

dInvWishart(diag(3), df = 5, .2*diag(3))


## ----threedensities------------------------------------------------------
set.seed(20180311)
A <- rWishart(n = 3, df = 3, Sigma = diag(3))
dWishart(A, df = 3, Sigma = diag(3))


## ----lmvgamma------------------------------------------------------------
lmvgamma(1:4,1) # note how they agree when p = 1
lgamma(1:4)

