library(aucm)


### Name: getQ
### Title: getQ
### Aliases: getQ getQ

### ** Examples


dat = sim.dat.1(n=100,seed=1)
dat=rbind(subset(dat, y==1), subset(dat, y==0))
X = as.matrix(subset(dat, select=c(x1,x2)))
n1=sum(dat$y)
n2=sum(1-dat$y)

K = kyotil::getK(X,"linear", 1)
Q1 = getQ(K,n1=n1,n2=n2,call.C=FALSE)
Q2 = getQ(K,n1=n1,n2=n2,call.C=TRUE)
all(Q2-Q1<1e-6)

# compare to a direct computation
X.diff=get.X.diff(X[1:n1,], X[1:n2+n1,])
Q3 = tcrossprod(X.diff, X.diff)
all(Q3-Q1<1e-6)

# two printouts of Q2 should not be different
Q2[1:3,1:3]
K = kyotil::getK(X,"rbf", 1)
Q4 = getQ(K,n1=n1,n2=n2,call.C=TRUE)
Q2[1:3,1:3]
Q4[1:3,1:3]

K = kyotil::getK(X[1:10,],"linear", 1, X2=X)
Q5 = getQ(K,n1=n1,n2=n2,call.C=FALSE,do.pred=TRUE)
Q6 = getQ(K,n1=n1,n2=n2,call.C=TRUE,do.pred=TRUE)
dim(Q5)
dim(Q6)
all(Q5-Q6<1e-6)






