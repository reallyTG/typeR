library(rlfsm)


### Name: sf
### Title: Statistic V
### Aliases: sf

### ** Examples

m<-45; M<-60; N<-2^10-M
alpha<-1.8; H<-0.8; sigma<-0.3
freq='L'
r=1; k=2; p=0.4
S<-(1:20)*100

path_lfsm<-function(...){

    List<-path(...)
    List$lfsm

}

Pths<-lapply(X=S,FUN=path_lfsm,
             m=m, M=M, alpha=alpha, sigma=sigma, H=H,
             freq=freq, disable_X = FALSE,
             levy_increments = NULL, seed = NA)

f_phi<-function(t,x) cos(t*x)
f_pow<-function(x,p) (abs(x))^p

V_cos<-sapply(Pths,FUN=sf,f=f_phi,k=k,r=r,H=H,freq=freq,t=1)
ex<-exp(-(abs(sigma*Norm_alpha(h_kr,alpha=alpha,k=k,r=r,H=H,l=0)$result)^alpha))

 # Illustration of the law of large numbers for phi:
plot(y=V_cos, x=S, ylim = c(0,max(V_cos)+0.1))
abline(h=ex, col='brown')

# Illustration of the law of large numbers for power functions:
Mpk<-m_pk(k=k, p=p, alpha=alpha, H=H, sigma=sigma)

sf_mod<-function(Xpath,...) {

    Path<-unlist(Xpath)
    sf(path=Path,...)
}

V_pow<-sapply(Pths,FUN=sf_mod,f=f_pow,k=k,r=r,H=H,freq=freq,p=p)
plot(y=V_pow, x=S, ylim = c(0,max(V_pow)+0.1))
abline(h=Mpk, col='brown')





