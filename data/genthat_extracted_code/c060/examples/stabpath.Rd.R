library(c060)


### Name: stabpath
### Title: Stability path for glmnet models
### Aliases: stabpath
### Keywords: stability selection

### ** Examples
## Not run: 
##D #gaussian
##D set.seed(1234)
##D x <- matrix(rnorm(100*1000,0,1),100,1000)
##D y <- x[1:100,1:1000]%*% c(rep(2,5),rep(-2,5),rep(.1,990))
##D res <- stabpath(y,x,weakness=1,mc.cores=2)
##D plot(res)
##D 
##D #binomial
##D y=sample(1:2,100,replace=TRUE)
##D res <- stabpath(y,x,weakness=1,mc.cores=2,family="binomial")
##D plot(res)
##D     
##D #multinomial
##D y=sample(1:4,100,replace=TRUE)
##D res <- stabpath(y,x,weakness=1,mc.cores=2,family="multinomial")
##D plot(res)
##D     
##D #poisson
##D N=100; p=1000
##D nzc=5
##D x=matrix(rnorm(N*p),N,p)
##D beta=rnorm(nzc)
##D f = x[,seq(nzc)]%*%beta
##D mu=exp(f)
##D y=rpois(N,mu)
##D res <- stabpath(y,x,weakness=1,mc.cores=2,family="poisson")
##D plot(res)
##D 
##D #Cox
##D library(survival)
##D set.seed(10101)
##D N=100;p=1000
##D nzc=p/3
##D x=matrix(rnorm(N*p),N,p)
##D beta=rnorm(nzc)
##D fx=x[,seq(nzc)]%*%beta/3
##D hx=exp(fx)
##D ty=rexp(N,hx)
##D tcens=rbinom(n=N,prob=.3,size=1)
##D y=cbind(time=ty,status=1-tcens)
##D res <- stabpath(y,x,weakness=1,mc.cores=2,family="cox")
##D plot(res)
## End(Not run)



