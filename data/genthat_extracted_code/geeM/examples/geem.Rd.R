library(geeM)


### Name: geem
### Title: Fit Generalized Estimating Equations
### Aliases: geem geeM-package geeM
### Keywords: models robust

### ** Examples

### Generated Negative Binomial Data
generatedata <- function(beta,alpha,gamma,X,T,n)  {
     mean.vec <- exp(crossprod(t(X),beta))
     y <- matrix(0,nrow=n,ncol=T)
     y[,1] <- rnbinom(n,mu = mean.vec[1],size=mean.vec[1]/gamma)
     for (i in 1:n)  {
        for (t in 2:T)  {
           innovation.mean <- mean.vec[t] - alpha*(sqrt(mean.vec[t]*mean.vec[t-1]))
           I <- rnbinom(1,mu= innovation.mean,size= innovation.mean/gamma)           
           first.shape <- alpha*sqrt(mean.vec[t]*mean.vec[t-1])/gamma
           second.shape <- mean.vec[t-1]/gamma - first.shape
           u <- rbeta(1,shape1 = first.shape,shape2=second.shape)
           a <- rbinom(1,size=y[i,t-1],prob=u)
           y[i,t] = a + I
        }
     }
     longform <- c(t(y))
     print(apply(y,2,mean))
     simdata <- data.frame(count = longform, time = rep(X[,2],times=n),subject=rep(c(1:n),each=T))
     return(simdata)
}

X <- cbind(rep(1,5),c(-.5,-.25,0,.25,.5))
testdat <- generatedata(beta=c(1,.5),alpha=.2,gamma=.5,X=X,T=5,n=3000)
far1 <- geem(count~ time, id=subject ,data = testdat, family=poisson, 
	corstr="ar1")

### Ohio respiratory data from geepack
if(require(geepack)){
	data("ohio", package="geepack")
	resplogit <- geem(resp ~ age + smoke + age:smoke, id=id, data = ohio, family = binomial,
	corstr = "m-dep" , Mv=1)
  
  LinkFun <- function(arg){qcauchy(arg)}
  InvLink <- function(arg){pcauchy(arg)}
  InvLinkDeriv <- function(arg){dcauchy(arg)}
  VarFun <- function(arg){arg*(1-arg)}
  FunList <- list(LinkFun, VarFun, InvLink, InvLinkDeriv)
  
  respcauchit <- geem(resp ~ age + smoke + age:smoke, id=id, data = ohio, family = FunList,
  corstr = "m-dep" , Mv=1)
}

### Seizure data from geepack
if(require(geepack)){
	data("seizure", package="geepack")
	seiz.l <- reshape(seizure,
	varying=list(c("base","y1", "y2", "y3", "y4")),
		v.names="y", times=0:4, direction="long")
		seiz.l <- seiz.l[order(seiz.l$id, seiz.l$time),]
		seiz.l$t <- ifelse(seiz.l$time == 0, 8, 2)
		seiz.l$x <- ifelse(seiz.l$time == 0, 0, 1)

	seiz <- geem(y~ x + trt + x:trt+ offset(log(t)), id=id,data = seiz.l, 
	family = poisson, corstr = "exchangeable")
}




