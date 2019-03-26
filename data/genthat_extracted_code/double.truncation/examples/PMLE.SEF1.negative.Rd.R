library(double.truncation)


### Name: PMLE.SEF1.negative
### Title: Parametric inference for the one-parameter SEF model (negative
###   parameter space)
### Aliases: PMLE.SEF1.negative
### Keywords: Special exponential family Exponential distribution

### ** Examples

### Data generation: see Appendix of Hu and Emura (2015) ###
eta_true=-3
eta_u=-9
eta_v=-1
tau=10
n=300

a=u=v=y=c()

j=1
repeat{
  u1=runif(1,0,1)
  u[j]=tau+(1/eta_u)*log(1-u1)
  u2=runif(1,0,1)
  v[j]=tau+(1/eta_v)*log(1-u2)
  u3=runif(1,0,1)
  y[j]=tau+(1/eta_true)*log(1-u3)
  if(u[j]<=y[j]&&y[j]<=v[j]) a[j]=1 else a[j]=0
  if(sum(a)==n) break
  j=j+1
}
mean(a) ## inclusion probability around 0.5
  
v.trunc=v[a==1]
u.trunc=u[a==1]
y.trunc=y[a==1]

PMLE.SEF1.negative(u.trunc,y.trunc,v.trunc)



