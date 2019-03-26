library(NCutYX)


### Name: ancut
### Title: Cluster the Columns of Y into K Groups with the Help of External
###   Features X.
### Aliases: ancut

### ** Examples

#This sets up the initial parameters for the simulation.
library(MASS)#for mvrnorm
library(fields)
n=30 #Sample size
B=50 #Number of iterations in the simulated annealing algorithm.
L=10000 #Temperature coefficient.
p=50 #Number of columns of Y.
q=p #Number of columns of X.
h1=0.15
h2=0.25

S=matrix(0.2,q,q)
S[1:(q/2),(q/2+1):q]=0
S[(q/2+1):q,1:(q/2)]=0
S=S-diag(diag(S))+diag(q)

mu=rep(0,q)

W0=matrix(1,p,p)
W0[1:(p/2),1:(p/2)]=0
W0[(p/2+1):p,(p/2+1):p]=0
Denum=sum(W0)

B2=matrix(0,q,p)
for (i in 1:(p/2)){
   B2[1:(q/2),i]=runif(q/2,h1,h2)
   in1=sample.int(q/2,6)
   B2[-in1,i]=0
}

for (i in (p/2+1):p){
   B2[(q/2+1):q,i]=runif(q/2,h1,h2)
   in2=sample(seq(q/2+1,q),6)
   B2[-in2,i]=0
}

X=mvrnorm(n, mu, S)
Z=X%*%B2
Y=Z+matrix(rnorm(n*p,0,1),n,p)
#Our method
Res=ancut(Y=Y,X=X,B=B,L=L,alpha=0,ncv=3)
Cx=Res[[2]]
f11=matrix(Cx[,1],p,1)
f12=matrix(Cx[,2],p,1)

errorL=sum((f11%*%t(f11))*W0)/Denum+sum((f12%*%t(f12))*W0)/Denum
#This is the true error of the clustering solution.
errorL

par(mfrow=c(1,2))
#Below is a plot of the simulated annealing path.
plot(Res[[1]],type='l',ylab='')
#Cluster found by ANCut
image.plot(Cx)



