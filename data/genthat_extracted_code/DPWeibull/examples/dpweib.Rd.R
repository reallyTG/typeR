library(DPWeibull)


### Name: dpweib
### Title: Dirichlet process mixture/Dependent Dirichlet process model for
###   survival/competing risks data
### Aliases: dpweib

### ** Examples

## Not run: 
##D library("DPWeibull")
##D #example for no regression data without competing risks
##D p<-0.8
##D mu1<-0
##D mu2<-1.2
##D sigma1<-sqrt(0.25)
##D sigma2<-sqrt(0.02)
##D npts<-200
##D index<-rbinom(npts,1,p)
##D x.orig<-ifelse(index,rlnorm(npts,mu1,sigma1),rlnorm(npts,mu2,sigma2))
##D tl<-x.orig
##D tr<-x.orig
##D event<-rep(1,npts)
##D y<-cbind(tl,tr,event)
##D result<-dpweib(y~1)
##D summary(result)
##D plot(result)
##D 
##D ##################################################################
##D 
##D # example for regression data without competing risks
##D library("DPWeibull")
##D rweib<-function(n,alpha,lambda)
##D {
##D (-log(runif(n))/lambda)^(1/alpha)
##D }
##D npts<-400
##D x1<-rnorm(npts)
##D x2<-rnorm(npts)
##D x<-cbind(x1,x2)
##D lambdagen<-exp(0.2*x1+0.2*x2)
##D x.orig<-1:npts
##D for(i in 1:npts){
##D x.orig[i]<-rweib(1,3,lambdagen[i])
##D }
##D tl<-x.orig
##D tr<-x.orig
##D event<-rep(1,npts)
##D xpred<-matrix(c(0,0),ncol=2)
##D time<-(1:40)/20
##D y<-cbind(tl,tr,event)
##D data<-data.frame(y=y,x1=x1,x2=x2)
##D result<-dpweib(y~x1+x2, data, quantile(x.orig,0.95),predtime=time, comp=FALSE)
##D plot(result,,simultaneous=TRUE)
##D summary(result)
##D predresult<-predict(result,xpred)
##D plot(predresult)
##D summary(predresult)
##D 
##D #######################################################################
##D 
##D #competing risks model without covariates
##D library("DPWeibull")
##D npts<-200
##D p<-0.8
##D u1<-runif(npts)
##D c<-ifelse(u1<p,1,2)
##D r1<-1
##D r2<-1
##D a<-0
##D b<-2.2
##D u2<-runif(npts)
##D t<-ifelse(c==1,-log(1-u2)/r1,-log(1-u2)/r2)
##D u3<-runif(npts,a,b)
##D c<-ifelse(u3<t,0,c)
##D t<-ifelse(c==0,u3,t)
##D times<-(1:50)/50*2.5
##D y<-cbind(t,c)
##D result<-dpweib(y~1,predtime=times,burnin=2000,iteration=2000)
##D summary(result)
##D plot(result)
##D result<-continue(result,simultaneous=TRUE,burnin=2000,iteration=2000)
##D summary(result)
##D plot(result)
##D 
##D ############################################################################
##D 
##D #competing risks data with factor covariates
##D library("DPWeibull")
##D npts<-400
##D x1<-rbinom(npts,1,0.5)
##D x2<-rbinom(npts,1,0.5)
##D x<-cbind(x1,x2)
##D beta1<-c(-1,1)
##D beta2<-c(2,-2)
##D alphagen1<-2
##D alphagen2<-0.7
##D lambdagen1<-exp(-6)
##D lambdagen2<-exp(-2)
##D inverseweib<-function(u,alpha,lambda){
##D   (-log(1-u)/lambda)^(1/alpha)
##D }
##D zbeta1<-x %*% beta1
##D zbeta2<-x %*% beta2
##D p<-0.8
##D p1<-1-(1-p)^exp(zbeta1)
##D u2<-runif(npts)
##D G1<-1/p*(1-(1-u2*p1)^exp(-zbeta1))
##D G2<-1-(1-u2)^exp(-zbeta2)
##D t1<-inverseweib(G1,alphagen1,lambdagen1)
##D t2<-inverseweib(G2,alphagen2,lambdagen2)
##D u1<-runif(npts)
##D c<-ifelse(u1<p1,1,2)
##D t<-ifelse(c==1,t1,t2)
##D cens<-runif(npts,0,200)
##D event<-ifelse(t<cens,c,0)
##D time<-ifelse(c==0,cens,t)
##D x1<-ifelse(x1==1,"good","bad")
##D x2<-ifelse(x2==1,"good","bad")
##D x2pred<-factor(rep(c("good","bad"),times=2))
##D x1pred<-factor(c("good","good","bad","bad"))
##D xpred<-cbind(x1pred,x2pred)
##D y<-cbind(time,event)
##D result<-dpweib(y~factor(x1)+factor(x2),predtime=(1:50)*2)
##D summary(result)
##D plot(result)
##D newresult<-predict(result,xpred)
##D summary(newresult)
##D plot(newresult)
## End(Not run)



