library(OBMbpkg)


### Name: OBMb
### Title: Objective Bayesian Analysis for the Mb Capture-Recapture Model
### Aliases: OBMb

### ** Examples


# Data simulation example
k=10
tN=600   #True N
p=0.06
JN=rep(0,k+1)

N=rep(0,k)
x=rep(0,k)
for (j in 1:k){
  N[j]=tN-JN[j]
  x[j]=rbinom(1,N[j],p)
  JN[j+1]=JN[j]+x[j]
}
M=sum(JN[1:k])
n=JN[k+1]

OBMb(k=k,n=n,M=M,x=x)

#Deer mouse example from Otis et al 1978
Data<-c(15, 8, 6, 3, 3, 3)   #new animals captured at each sampling occasion

OBMb(k=6,n=38,M=134,x=Data)



