library(double.truncation)


### Name: PMLE.SEF1.positive
### Title: Parametric Inference for the one-parameter SEF model (positive
###   parameter space)
### Aliases: PMLE.SEF1.positive
### Keywords: Special exponential family Exponential distribution

### ** Examples

#### Data generation: Appendix of Hu and Emura (2015)
eta_true=3
eta_u=1
eta_v=9
tau=10
n=300

a=u=v=y=c()

j=1
repeat{
  u1=runif(1,0,1)
  u[j]=tau+(1/eta_u)*log(u1)
  u2=runif(1,0,1)
  v[j]=tau+(1/eta_v)*log(u2)
  u3=runif(1,0,1)
  y[j]=tau+(1/eta_true)*log(u3)
  if(u[j]<=y[j]&&y[j]<=v[j]) a[j]=1 else a[j]=0
  if(sum(a)==n) break
  j=j+1
}
mean(a) ## inclusion probability around 0.5

v.trunc=v[a==1]
u.trunc=u[a==1]
y.trunc=y[a==1]

PMLE.SEF1.positive(u.trunc,y.trunc,v.trunc)



