library(c060)


### Name: epsgo
### Title: Efficient Parameter Selection via Global Optimization
### Aliases: epsgo
### Keywords: models multivariate graphs iteration optimize

### ** Examples

## Not run: 
##D set.seed(1010)
##D n=1000;p=100
##D nzc=trunc(p/10)
##D x=matrix(rnorm(n*p),n,p)
##D beta=rnorm(nzc)
##D fx= x[,seq(nzc)] %*% beta
##D eps=rnorm(n)*5
##D y=drop(fx+eps)
##D px=exp(fx)
##D px=px/(1+px)
##D ly=rbinom(n=length(px),prob=px,size=1)
##D set.seed(1011)
##D 
##D  
##D nfolds = 10
##D set.seed(1234)
##D foldid <- balancedFolds(class.column.factor=y.classes, cross.outer=nfolds)
##D 
##D # y - binomial
##D y.classes<-ifelse(y>= median(y),1, 0)
##D bounds <- t(data.frame(alpha=c(0, 1)))
##D colnames(bounds)<-c("lower","upper")
##D  
##D fit <- epsgo(Q.func="tune.glmnet.interval", 
##D              bounds=bounds, 
##D              parms.coding="none", 
##D              seed = 1234, 
##D              show="none",
##D              fminlower = -100,
##D              x = x, y = y.classes, family = "binomial", 
##D              foldid = foldid,
##D              type.min = "lambda.1se",
##D              type.measure = "mse")
##D summary(fit)
##D 
##D # y - multinomial: low - low 25%, middle - (25,75)-quantiles, high - larger 75%.
##D y.classes<-ifelse(y <= quantile(y,0.25),1, ifelse(y >= quantile(y,0.75),3, 2))
##D bounds <- t(data.frame(alpha=c(0, 1)))
##D colnames(bounds)<-c("lower","upper")
##D  
##D fit <- epsgo(Q.func="tune.glmnet.interval", 
##D              bounds=bounds, 
##D              parms.coding="none", 
##D              seed = 1234, 
##D              show="none",
##D              fminlower = -100,
##D              x = x, y = y.classes, family = "multinomial", 
##D              foldid = foldid,
##D              type.min = "lambda.1se",
##D              type.measure = "mse")
##D summary(fit)
##D 
##D ##poisson
##D N=500; p=20
##D nzc=5
##D x=matrix(rnorm(N*p),N,p)
##D beta=rnorm(nzc)
##D f = x[,seq(nzc)]##D 
##D mu=exp(f)
##D y.classes=rpois(N,mu)
##D 
##D nfolds = 10
##D set.seed(1234)
##D foldid <- balancedFolds(class.column.factor=y.classes, cross.outer=nfolds)
##D 
##D 
##D fit <- epsgo(Q.func="tune.glmnet.interval", 
##D              bounds=bounds, 
##D              parms.coding="none", 
##D              seed = 1234, 
##D              show="none",
##D              fminlower = -100,
##D              x = x, y = y.classes, family = "poisson", 
##D              foldid = foldid,
##D              type.min = "lambda.1se",
##D              type.measure = "mse")
##D summary(fit)
##D 
##D #gaussian
##D set.seed(1234)
##D x=matrix(rnorm(100*1000,0,1),100,1000)
##D y <- x[1:100,1:1000]%*%c(rep(2,5),rep(-2,5),rep(.1,990))
##D 
##D foldid <- rep(1:10,each=10)
##D 
##D fit <- epsgo(Q.func="tune.glmnet.interval", 
##D              bounds=bounds, 
##D              parms.coding="none", 
##D              seed = 1234, 
##D              show="none",
##D              fminlower = -100,
##D              x = x, y = y, family = "gaussian", 
##D              foldid = foldid,
##D              type.min = "lambda.1se",
##D              type.measure = "mse")
##D summary(fit)  
##D 
##D # y - cox in vingette
## End(Not run)



