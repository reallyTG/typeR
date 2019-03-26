library(elliptic)


### Name: parameters
### Title: Parameters for Weierstrass's P function
### Aliases: parameters e18.7.4 e18.7.5 e18.7.7 e18.3.5 e18.3.3 e18.3.37
###   e18.3.38 e18.3.39
### Keywords: math

### ** Examples

 ## Example 6, p665, LHS
 parameters(g=c(10,2+0i))


 ## Example 7, p665, RHS
 a <- parameters(g=c(7,6)) ;  attach(a)
 c(omega2=Omega[1],omega2dash=Omega[1]+Omega[2]*2)


  ## verify 18.3.37:
  Eta[2]*Omega[1]-Eta[1]*Omega[2]   #should be close to pi*1i/2


## from Omega to g and and back;
## following should be equivalentto c(1,1i):
 parameters(g=parameters(Omega=c(1,1i))$g)$Omega 





