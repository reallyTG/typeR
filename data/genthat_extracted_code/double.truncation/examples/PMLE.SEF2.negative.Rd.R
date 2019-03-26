library(double.truncation)


### Name: PMLE.SEF2.negative
### Title: Parametric Inference for the two-parameter SEF model (negative
###   parameter space for eta_2)
### Aliases: PMLE.SEF2.negative
### Keywords: Special exponential family Normal distribution

### ** Examples

### Data generation: see Appendix of Hu and Emura (2015)
n=300
eta1_true=30
eta2_true=-0.5
mu_true=30
mu_u=29.09
mu_v=30.91

a=u=v=y=c()

###generate n samples of (ui,yi,vi) subject to ui<=yi<=vi###
j=1
repeat{  
  u[j]=rnorm(1,mu_u,1)
  v[j]=rnorm(1,mu_v,1)
  y[j]=rnorm(1,mu_true,1)
  if(u[j]<=y[j]&&y[j]<=v[j]) a[j]=1 else a[j]=0
  if(sum(a)==n) break ###we need n data set###
  j=j+1
}
mean(a) ### inclusion probability around 0.5 ###

v.trunc=v[a==1]
y.trunc=y[a==1]
u.trunc=u[a==1]
  
PMLE.SEF2.negative(u.trunc,y.trunc,v.trunc)



