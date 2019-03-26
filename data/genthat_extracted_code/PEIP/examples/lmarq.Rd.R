library(PEIP)


### Name: lmarq
### Title: Lev-Marquardt Inversion
### Aliases: lmarq
### Keywords: misc

### ** Examples

fun<-function(p){
###  Compute the function values.
fvec=rep(0,length(TM))
fvec=(Q*exp(-D^2*p[1]/(4*p[2]*TM))/(4*pi*p[2]*TM) - H)/SIGMA
  return(fvec)
}
jac <-function( p)
  {
###  use known formula for the derivatives in the Jacobian
    n=length(TM)
    J= matrix(0,nrow=n,ncol=2)

      J[,1]=(-Q*D^2*exp(-D^2*p[1]/(4*p[2]*TM))/(16*pi*p[2]^2*TM^2))/SIGMA
      
      J[,2]=(Q/(4*pi*p[2]^2*TM))*
          ((D^2*p[1])/(4*p[2]*TM)-1)*exp(-D^2*p[1]/(4*p[2]*TM))/SIGMA
   return(J)
  }

H=c(0.72, 0.49, 0.30, 0.20, 0.16, 0.12)
TM=c(5.0, 10.0, 20.0, 30.0, 40.0, 50.0)

###  Fixed parameter values.
D=60
Q=50
###  We'll use sigma=1cm.  
SIGMA=0.01*rep(1,length(H))
###  The unknown/estimated parameters are S=p(1) and T=p(2).
p0=c(0.001, 1.0)
###  Solve the least squares problem with LM.
 PEST =  lmarq('fun','jac',p0,1.0e-12,100)




