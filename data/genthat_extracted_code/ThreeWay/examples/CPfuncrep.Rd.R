library(ThreeWay)


### Name: CPfuncrep
### Title: Algorithm for the Candecomp/Parafac (CP) model
### Aliases: CPfuncrep
### Keywords: array multivariate algebra

### ** Examples

data(TV)
TVdata=TV[[1]]
# permutation of the modes so that the A-mode refers to students
TVdata <- permnew(TVdata, 16, 15, 30)
TVdata <- permnew(TVdata, 15, 30, 16)
# unconstrained CP solution using two components 
# (rational starting point by SVD [start=0])
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 1, 1, 1, 0, 1e-6, 10000)
# constrained CP solution using two components with orthogonal A-mode  
# component matrix (rational starting point by SVD [start=0])
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 2, 1, 1, 0, 1e-6, 10000)
# constrained CP solution using two components with orthogonal A-mode 
# component matrix and zero correlated C-mode component matrix 
# (rational starting point by SVD [start=0])
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 2, 1, 3, 0, 1e-6, 10000)
# unconstrained CP solution using two components 
# (random orthonormalized starting point [start=1])
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 1, 1, 1, 1, 1e-6, 10000)
# unconstrained CP solution using two components (user starting point [start=2])
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 1, 1, 1, 2, 1e-6, 10000, 
 matrix(rnorm(30*2),nrow=30), matrix(rnorm(16*2),nrow=16), 
 matrix(rnorm(15*2),nrow=15))



