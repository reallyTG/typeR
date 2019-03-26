library(perARMA)


### Name: R_w_ma
### Title: Covariance matrix for PARMA model (conditional)
### Aliases: R_w_ma
### Keywords: covariance of PARMA sequence

### ** Examples

T=12
nlen=480
p=2
 a=matrix(0,T,p)
q=1
 b=matrix(0,T,q)
a[1,1]=.8                  
a[2,1]=.3                 
                          
phia<-ab2phth(a) 
phi0=phia$phi          
phi0=as.matrix(phi0)        
      
b[1,1]=-.7	          
b[2,1]=-.6                  
thetab<-ab2phth(b)         
theta0=thetab$phi  
theta0=as.matrix(theta0) 
del0=matrix(1,T,1)    


R_w_ma(cbind(del0,theta0),p+1,T)    




