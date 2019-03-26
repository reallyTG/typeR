library(rlfsm)


### Name: Plot_vb
### Title: A function to plot variance- and bias dependencies on n. Works
###   in conjunction with 'CLT' function.
### Aliases: Plot_vb

### ** Examples


# Light weight computaions

m<-25; M<-50
alpha<-1.8; H<-0.8; sigma<-0.3
S<-c(1:3)*1e2
p<-.4; p_prime<-.2; t1<-1; t2<-2
k<-2; NmonteC<-50

# Here is the continuous H-1/alpha inference procedure
theor_3_1_H_clt<-CLT(s=S,fr='H',Nmc=NmonteC,
                     m=m,M=M,alpha=alpha,H=H,
                     sigma=sigma,ContinEstim,
                     t1=t1,t2=t2,p=p,k=k)
Plot_vb(theor_3_1_H_clt$BSdM)

## No test: 
# More demanding example (it is better to use multicore setup)
# General low frequency inference

m<-45; M<-60
alpha<-0.8; H<-0.8; sigma<-0.3
S<-c(1:15)*1e2
p<-.4; t1<-1; t2<-2
NmonteC<-50

# Here is the continuous H-1/alpha inference procedure
theor_4_1_H_clt<-CLT(s=S,fr='H',Nmc=NmonteC,
                     m=m,M=M,alpha=alpha,H=H,
                     sigma=sigma,GenLowEstim,
                     t1=t1,t2=t2,p=p)
Plot_vb(theor_4_1_H_clt$BSdM)
## End(No test)




