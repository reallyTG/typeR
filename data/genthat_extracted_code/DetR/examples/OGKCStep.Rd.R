library(DetR)


### Name: OGKCStep
### Title: Robust and Deterministic Linear Regression via OGKCStep
### Aliases: OGKCStep
### Keywords: multivariate robust deterministic

### ** Examples

n<-100
set.seed(123)# for reproducibility
x0<-matrix(rnorm(n*2),nc=2)
out1<-OGKCStep(x0,alpha=0.5,scale_est=pcaPP::qn)

#comparaison with DetMCD:

#a) create data

set.seed(123456)
Simulation<-DetR:::fx01()
#should be \approx 10
sqrt(min(mahalanobis(Simulation$Data[Simulation$label==0,],rep(0,ncol(Simulation$Data)),
Simulation$Sigma_u))/qchisq(0.975,df=ncol(Simulation$Data)))
a0<-eigen(Simulation$Sigma_u)
Su_ih<-(a0$vector)%*%diag(1/sqrt(a0$values))%*%t(a0$vector)
#run algorithms 
A0<-robustbase::covMcd(Simulation$Data,nsamp='deterministic',scalefn=pcaPP::qn,alpha=0.5)
A1<-OGKCStep(Simulation$Data,alpha=0.5,scale_est=pcaPP::qn)
#getbiases algorithms 
SB<-eigen(Su_ih%*%var(Simulation$Data[A1,])%*%Su_ih)$values
log10(SB[1]/SB[ncol(Simulation$Data)-1])
SB<-eigen(Su_ih%*%var(Simulation$Data[A0$best,])%*%Su_ih)$values
log10(SB[1]/SB[ncol(Simulation$Data)-1])



