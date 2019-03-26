library(rlfsm)


### Name: Plot_dens
### Title: (alpha,H,sigma)- density plot
### Aliases: Plot_dens

### ** Examples

## No test: 
m<-45; M<-60

p<-.4; p_prime<-.2
t1<-1; t2<-2; k<-2

NmonteC<-5e2
S<-c(1e3,1e4)
alpha<-.8; H<-0.8; sigma<-0.3
theor_4_1_clt_new<-CLT(s=S,fr='L',Nmc=NmonteC,
                       m=m,M=M,
                       alpha=alpha,H=H,sigma=sigma,
                       GenLowEstim,t1=t1,t2=t2,p=p)
l_plot<-Plot_dens(par_vec=c('sigma','alpha','H'), CLT_data=theor_4_1_clt_new, Nnorm=1e7)
l_plot

## End(No test)



