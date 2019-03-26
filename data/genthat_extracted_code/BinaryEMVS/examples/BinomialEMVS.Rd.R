library(BinaryEMVS)


### Name: BinomialEMVS
### Title: Variable Selection For Binary Data Using The EM Algorithm
### Aliases: BinomialEMVS

### ** Examples

#Generate data
set.seed(1)
n=25;p=500;pr=10;cor=.6
X=data.sim(n,p,pr,cor)

#Randomly generate related beta coefficnets from U(-1,1)
beta.Vec=rep(0,times=p)
beta.Vec[1:pr]=runif(pr,-1,1)

y=scale(X%*%beta.Vec+rnorm(n,0,sd=sqrt(3)),center=TRUE,scale=FALSE)
prob=1/(1+exp(-y))
y.bin=t(t(ifelse(rbinom(n,1,prob)>0,1,0)))

result.probit=BinomialEMVS(y=y.bin,x=X,type="probit")
result.logit=BinomialEMVS(y=y.bin,x=X,type="logit")

which(result.probit$posts>.5)
which(result.logit$posts>.5)




