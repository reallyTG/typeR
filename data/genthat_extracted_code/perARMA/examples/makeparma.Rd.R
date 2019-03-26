library(perARMA)


### Name: makeparma
### Title: Simulation of PARMA sequence
### Aliases: makeparma makepar

### ** Examples

##################### simulation of PARMA(2,1)
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

PARMA21<-makeparma(nlen,phi0,theta0,del0)
parma<-PARMA21$y
plot(ts(parma))

##################### simulation of PAR(2)
T=24
nlen=1000
p=2
a=matrix(0,T,p)
a[1,1]=.5
a[2,2]=.4

phia<-ab2phth(a)
phi0=phia$phi
phi0=as.matrix(phi0)

del0=matrix(1,T,1)

PAR1<-makepar(nlen,phi0,del0)
par<-PAR1$y
plot(ts(par))



