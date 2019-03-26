library(Copula.surv)


### Name: U1.Clayton
### Title: Estimation of an association parameter via the pseudo-likelihood
### Aliases: U1.Clayton
### Keywords: Clayton copula ~kwd2

### ** Examples

n=200
theta_true=2 ## association parameter ##
r1_true=1 ## hazard for X
r2_true=1 ## hazard for Y

set.seed(1)
V1=runif(n)
V2=runif(n)
X=-1/r1_true*log(1-V1)
W=(1-V1)^(-theta_true)
Y=1/theta_true/r2_true*log(  1-W+W*(1-V2)^(-theta_true/(theta_true+1))  )
C=runif(n,min=0,max=5)

x.obs=pmin(X,C)
y.obs=pmin(Y,C)
dx=X<=C
dy=Y<=C

U1.Clayton(x.obs,y.obs,dx,dy)




