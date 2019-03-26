library(longROC)


### Name: roc.
### Title: ROC curve
### Aliases: roc.s

### ** Examples

# parameters
n=100
tt=3
Tmax=10
u=1.5
s=sample(3,n,replace=TRUE)
vtimes=c(0,1,2,5)

# generate data 

ngrid=5000
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

## 

## an important marker 

ro=roc.s(S2,Ti,delta,u,tt,s,vtimes) 
plot(ro,type="l",col="red")
abline(a=0,b=1)

## an unrelated marker 

ro=roc.s(S1,Ti,delta,u,tt,s,vtimes) 
plot(ro,type="l",col="red")
abline(a=0,b=1)




