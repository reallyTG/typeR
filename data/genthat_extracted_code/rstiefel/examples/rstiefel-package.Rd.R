library(rstiefel)


### Name: rstiefel-package
### Title: Random Orthonormal Matrix Generation on the Stiefel Manifold #'
###   Simulation of random orthonormal matrices from linear and quadratic
###   exponential family distributions on the Stiefel manifold. The most
###   general type of distribution covered is the matrix-variate
###   Bingham-von Mises-Fisher distribution. Most of the simulation methods
###   are presented in Hoff(2009) "Simulation of the Matrix Bingham-von
###   Mises-Fisher Distribution, With Applications to Multivariate and
###   Relational Data" <doi:10.1198/jcgs.2009.07177>. The package also
###   includes functions for optimzation on the Stiefel manifold based on
###   algoirthms described in Wen and Yin (2013) "A feasible method for
###   optimization with orthogonality constraints"
###   <doi:10.1007/s10107-012-0584-1>.
### Aliases: rstiefel-package rstiefel
### Keywords: package

### ** Examples


Z<-matrix(rnorm(10*5),10,5) ; A<-t(Z)%*%Z 
B<-diag(sort(rexp(5),decreasing=TRUE))
U<-rbing.Op(A,B)
U<-rbing.matrix.gibbs(A,B,U)

U<-rmf.matrix(Z)
U<-rmf.matrix.gibbs(Z,U)




