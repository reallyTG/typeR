## ----setup---------------------------------------------------------------

library(SolveRationalMatrixEquation)

Q <- rbind(c(2,-1,0),c(-1,2,1),c(0,1,2))
L <- rbind(c(2,-2,18),c(2,1,0),c(1,2,0))

##QR Decomposition
QRdecompose(L)

##LQ Decompostion
LQdecompose(L)

##Solve Rational Matrix
X <- sol.rationalmatrix.euqation(Q, L)

#Checking the results
X - (Q + L %*% solve(X) %*% t(L))


