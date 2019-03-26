library(Replication)


### Name: llratio.imp
### Title: Log likelihood ratio and p-value for data imputed with mice
### Aliases: llratio.imp
### Keywords: htest

### ** Examples

## Don't show: 
#create data
rnorm2 <- function(n,mean,sd) { mean+sd*scale(rnorm(n)) }

# simple regression -------------------------------------------------------

set.seed(9)
#step 1 input
#create/load data
n.o=30 #sample size original data
y.o <- data.frame(y=rnorm2(n.o,0,1),x=rnorm2(n.o,3,1))
#y.o <- correlate(as.matrix(y.o), corm=.70); y.o <- data.frame(y=y.o[,1],x=y.o[,2])
n.r=50 #sample size new data
y.r <- data.frame(y=rnorm2(n.r,0.5,1),x=rnorm2(n.r,3,1))

#blavaan model
model <- '
y ~ x     #regression
y ~1      #intercept not default in lavaan (but is in blavaan)
'

#Warning: This is a minimal example;
step1.reg <- ppc.step1(y.o=y.o,model=model,nchains=2,n.r=10,nadapt=10,nburnin=10,nsample=10,nsim=10)

step23.reg <- ppc.step2step3(step1=step1.reg,y.r=NULL,model=model,H0=".p2. = -0.878&.p1. > 0.301")

y.r$y[runif(5,1,n.r)] <- NA #random missing data
imp <- mice(data=y.r,maxit=2,m=3)
llratio.imp(step2step3=step23.reg,imp=imp,model=model)
## End(Don't show)## No test: 
#the following example can be used, but takes >10 seconds

#create data
rnorm2 <- function(n,mean,sd) { mean+sd*scale(rnorm(n)) }

#step 1 input
#create/load data
n.o=30 #sample size original data
y.o <- data.frame(y=rnorm2(n.o,0,1),x=rnorm2(n.o,3,1))
n.r=80 #sample size new data
y.r <- data.frame(y=rnorm2(n.r,0.5,1),x=rnorm2(n.r,3,1))
y.r$y[runif(5,1,n.r)] <- NA #random missing data

#blavaan model
model <- '
y ~ x     #regression
y ~1      #intercept not default in lavaan (but is in blavaan)
'

step1.reg <- ppc.step1(y.o=y.o,model=model,n.r=n.r)

#H0: #reg > est, int = est       =       B1>0.302 & B0= -0.878
pT <- step1.reg$pT #parameter table
int.id <- which(pT$lhs=="y"&pT$op=="~1"&pT$rhs=="") #identify B0
reg.id <- which(pT$lhs=="y"&pT$op=="~"&pT$rhs=="x") #identify B1
hyp <- cbind(pT[c(int.id,reg.id),"plabel"],c("=",">"),c(pT[c(int.id,reg.id),"est"]))
print(hyp)
H0 <- paste(hyp[,1],hyp[,2],hyp[,3],collapse="&")

step23.reg <- ppc.step2step3(step1=step1.reg,y.r=NULL,model=model,H0)

y.r$y[runif(5,1,n.r)] <- NA #random missing data
imp <- mice(y.r,maxit=10,m=10)
llratio.imp(step2step3=step23.reg,imp=imp,model=model)
## End(No test)



