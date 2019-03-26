library(rlfsm)


### Name: CLT
### Title: The function explores numerical properties of statistical
###   estimators operating on random processes.
### Aliases: CLT

### ** Examples

#### Set of global parameters ####
m<-25; M<-60
p<-.4; p_prime<-.2; k<-2
t1<-1; t2<-2
NmonteC<-5e1
S<-c(1e2,3e2)
alpha<-1.8; H<-0.8; sigma<-0.3
theor_3_1_H_clt<-CLT(s=S,fr='H',Nmc=NmonteC,
                     m=m,M=M,alpha=alpha,H=H,
                     sigma=sigma,ContinEstim,
                     t1=t1,t2=t2,p=p,k=k)
l_plot<-Plot_dens(par_vec=c('sigma','alpha','H'),
                  CLT_data=theor_3_1_H_clt, Nnorm=1e7)



