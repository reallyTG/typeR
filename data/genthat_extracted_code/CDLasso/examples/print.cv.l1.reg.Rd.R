library(CDLasso)


### Name: print.cv.l1.reg
### Title: Print results of Greedy Coordinate Descent for L1 Regression
### Aliases: print.cv.l1.reg

### ** Examples

set.seed(100)
n=50 
p=200
nzfixed = c(1:5)
true.beta<-rep(0,p)
true.beta[nzfixed] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) %*% true.beta

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

crossval<-cv.l1.reg(x,y,10,(0:20)*2)
print(crossval)



