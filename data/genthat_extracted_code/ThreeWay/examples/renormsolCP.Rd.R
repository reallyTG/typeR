library(ThreeWay)


### Name: renormsolCP
### Title: Scaling of the Candecomp/Parafac solution
### Aliases: renormsolCP
### Keywords: array multivariate algebra

### ** Examples

data(TV)
TVdata=TV[[1]]
# permutation of the modes so that the A-mode refers to students
TVdata <- permnew(TVdata, 16, 15, 30)
TVdata <- permnew(TVdata, 15, 30, 16)
# CP solution
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 1, 1, 1, 0, 1e-6, 10000)
# sums of squares of A, B and C
sum(TVcp$A^2)
sum(TVcp$B^2)
sum(TVcp$C^2)
# Renormalization by scaling B- and C-modes
TVcpScalBC <- renormsolCP(TVcp$A, TVcp$B, TVcp$C, 1)
# sums of squares of A, B and C after renormalization
sum(TVcpScalBC$A^2)
sum(TVcpScalBC$B^2)
sum(TVcpScalBC$C^2)



