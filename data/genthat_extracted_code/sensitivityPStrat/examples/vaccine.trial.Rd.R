library(sensitivityPStrat)


### Name: vaccine.trial
### Title: Simulated Vaccine Trial Data
### Aliases: vaccine.trial
### Keywords: datasets

### ** Examples

set.seed(1063917538)
N<-2000
p0<-0.10
z<-c(rep(0,N/2),rep(1,N/2))
s0<-rbinom(N,1,p0)
y0<-rnorm(N,4.5,.75)
delta<-0
y1<-y0+delta
alpha<--4
beta<-1
w<-exp(alpha+beta*y0)/(1+exp(alpha+beta*y0))
s1<-s0*rbinom(N,1,w)
s<-s0*(1-z)+s1*z
y<-ifelse(s*(1-z)==1,y0,
    ifelse(s*z==1,y1,NA))
tjunk<-rexp(N,1/3)
cjunk<-runif(N,0,15)
t<-ifelse(s*(1-z)==1,tjunk,
    ifelse(s*z==1,tjunk,NA))
c1<-ifelse(s*(1-z)==1,cjunk,
     ifelse(s*z==1,cjunk,NA))
c<-pmin(c1,3)



treatment<-ifelse(z==1,"vaccine","placebo")
hiv.outcome<-ifelse(s==1,"infected","not infected")
logVL<-y
ARTinitiation<-ifelse(t<c,"initiated ART","no ART")
followup.yearsART<-round(pmin(t,c),2)


vaccine.trial<-data.frame(treatment=treatment,
                          hiv.outcome=hiv.outcome,
                          logVL=logVL, ARTinitiation=ARTinitiation,
                          followup.yearsART=followup.yearsART)



