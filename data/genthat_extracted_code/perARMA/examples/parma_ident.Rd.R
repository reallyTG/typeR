library(perARMA)


### Name: parma_ident
### Title: Identification of PC-T structure
### Aliases: parma_ident

### ** Examples


############### PC-T series simulation
T=12
nlen=480
descriptor='PARMA(2,1) periodic phis all del =1'
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

############### parma_ident use
parma_ident(t(y),T,NaN,descriptor,outdir='PARMA21del1_ident')




