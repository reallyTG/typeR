library(geophys)


### Name: PolarDecomp
### Title: Polar Decomposition
### Aliases: PolarDecomp
### Keywords: misc

### ** Examples



A = matrix(runif(4, -1, 1), ncol=2)
PD = PolarDecomp(A)

E = svd(A)

###  W         S           V
 E$u 

 ###t(E$v) %*% diag(E$d)%*%  (E$u)

P = E$v
U =  E$u 


U 





