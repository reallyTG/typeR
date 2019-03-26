library(longROC)


### Name: butstrap.nri
### Title: Bootstrapping NRI
### Aliases: butstrap.nri

### ** Examples

# parameters
n=25
tt=3
Tmax=10
u=1.5
s=2
vtimes=c(0,1,2,5)

# generate data 

ngrid=1000
ts=seq(0,Tmax,length=ngrid)
X2=matrix(rnorm(n*ngrid,0,0.1),n,ngrid)
for(i in 1:n) {
sa=sample(ngrid/6,1)
vals=sample(3,1)-1
X2[i,1:sa[1]]=vals[1]+X2[i,1:sa[1]]
X2[i,(sa[1]+1):ngrid]=vals[1]+sample(c(-2,2),1)+X2[i,(sa[1]+1):ngrid]
}

S1=matrix(sample(4,n,replace=TRUE),n,length(vtimes))
S2=matrix(NA,n,length(vtimes))

S2[,1]=X2[,1]

for(j in 2:length(vtimes)) {
tm=which.min(abs(ts-vtimes[j]))
S2[,j]=X2[,tm]}

cens=runif(n)
ripart=1-exp(-0.01*apply(exp(X2),1,cumsum)*ts/1:ngrid)

Ti=rep(NA,n)
for(i in 1:n) {
Ti[i]=ts[which.min(abs(ripart[,i]-cens[i]))]
}

cens=runif(n,0,Tmax*2)
delta=ifelse(cens>Ti,1,0)
Ti[cens<Ti]=cens[cens<Ti]

risk1=apply(S1[,1:s],1,sum)
risk1=(risk1-min(risk1))/(max(risk1)-min(risk1))
risk2=apply(S2[,1:s],1,sum)
risk2=(risk2-min(risk2))/(max(risk2)-min(risk2))
butstrap.nri(risk1,risk2,Ti,delta,u,tt,nri(risk1,risk2,Ti,delta,u,tt)$nri,wh=1,B=500)





