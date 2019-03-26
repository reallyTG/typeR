library(perARMA)


### Name: parmaf
### Title: PARMA coefficients estimation
### Aliases: parmaf

### ** Examples


######## simulation of periodic series
T=12
nlen=480
p=2
 a=matrix(0,T,p)
q=1
 b=matrix(0,T,q)
a[1,1]=.8                 
a[2,1]=.3                
                                                 
a[1,2]=-.9               
phia<-ab2phth(a) 
phi0=phia$phi            
phi0=as.matrix(phi0)       
      
b[1,1]=-.7	          
b[2,1]=-.6                  
thetab<-ab2phth(b)       
theta0=thetab$phi  
theta0=as.matrix(theta0) 
del0=matrix(1,T,1)        
makeparma_out<-makeparma(nlen,phi0,theta0,del0)                      
y=makeparma_out$y

## Do not run 
## It could take more than one minute

############ fitting of PARMA(0,1) model
#p=0
#q=1
#af=matrix(0,T,p)
#bf=matrix(0,T,q+1)
#bf[1,1]=1
#bf[1:3,2]=1

#parmaf(y,T,p,q,af,bf)

############ fitting of PARMA(2,0) model
#p=2
#q=0
#af=matrix(0,T,p)
#bf=matrix(0,T,q+1)
#af[1:3,1]=1       
#af[1:3,2]=1
#bf[1,1]=1

#parmaf(y,T,p,q,af,bf)

############ fitting of PARMA(2,1) model
#p=2
#q=1
#af=matrix(0,T,p)
#bf=matrix(0,T,q+1)
#af[1:3,1]=1       
#af[1:3,2]=1
#bf[1,1]=1
#bf[1:3,2]=1

#parmaf(y,T,p,q,af,bf)



