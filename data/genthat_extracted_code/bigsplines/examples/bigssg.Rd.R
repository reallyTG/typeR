library(bigsplines)


### Name: bigssg
### Title: Fits Generalized Smoothing Spline ANOVA Models
### Aliases: bigssg

### ** Examples


##########   EXAMPLE 1 (1-way GSSA)   ##########

# define univariate function and data
set.seed(1)
myfun <- function(x){ sin(2*pi*x) }
ndpts <- 1000
x <- runif(ndpts)

# binomial response (no weights)
set.seed(773)
lp <- myfun(x)
p <- 1/(1+exp(-lp))
y <- rbinom(n=ndpts,size=1,p=p)     ## y is binary data
gmod <- bigssg(y~x,family="binomial",type="cub",nknots=20)
crossprod( lp - gmod$linear.predictor )/length(lp)

# binomial response (with weights)
set.seed(773)
lp <- myfun(x)
p <- 1/(1+exp(-lp))
w <- sample(c(10,20,30,40,50),length(p),replace=TRUE)
y <- rbinom(n=ndpts,size=w,p=p)/w   ## y is proportion correct
gmod <- bigssg(y~x,family="binomial",type="cub",nknots=20,weights=w)
crossprod( lp - gmod$linear.predictor )/length(lp)

# poisson response
set.seed(773)
lp <- myfun(x)
mu <- exp(lp)
y <- rpois(n=ndpts,lambda=mu)
gmod <- bigssg(y~x,family="poisson",type="cub",nknots=20)
crossprod( lp - gmod$linear.predictor )/length(lp)

# Gamma response
set.seed(773)
lp <- myfun(x) + 2
mu <- 1/lp
y <- rgamma(n=ndpts,shape=4,scale=mu/4)
gmod <- bigssg(y~x,family="Gamma",type="cub",nknots=20)
1/gmod$dispersion   ## dispersion = 1/shape
crossprod( lp - gmod$linear.predictor )/length(lp)

# inverse gaussian response (not run: requires statmod package)
# require(statmod)
# set.seed(773)
# lp <- myfun(x) + 2
# mu <- sqrt(1/lp)
# y <- rinvgauss(n=ndpts,mean=mu,shape=2)
# gmod <- bigssg(y~x,family="inverse.gaussian",type="cub",nknots=20)
# 1/gmod$dispersion   ## dispersion = 1/shape
# crossprod( lp - gmod$linear.predictor )/length(lp)

# negative binomial response (known dispersion)
set.seed(773)
lp <- myfun(x)
mu <- exp(lp)
y <- rnbinom(n=ndpts,size=.5,mu=mu)
gmod <- bigssg(y~x,family=list("negbin",2),type="cub",nknots=20)
1/gmod$dispersion   ## dispersion = 1/size
crossprod( lp - gmod$linear.predictor )/length(lp)

# negative binomial response (unknown dispersion)
set.seed(773)
lp <- myfun(x)
mu <- exp(lp)
y <- rnbinom(n=ndpts,size=.5,mu=mu)
gmod <- bigssg(y~x,family="negbin",type="cub",nknots=20)
1/gmod$dispersion   ## dispersion = 1/size
crossprod( lp - gmod$linear.predictor )/length(lp)

## Not run: 
##D 
##D ##########   EXAMPLE 2 (2-way GSSA)   ##########
##D 
##D # function with two continuous predictors
##D set.seed(1)
##D myfun <- function(x1v,x2v){
##D   sin(2*pi*x1v) + log(x2v+.1) + cos(pi*(x1v-x2v))
##D }
##D ndpts <- 1000
##D x1v <- runif(ndpts)
##D x2v <- runif(ndpts)
##D 
##D # binomial response (no weights)
##D set.seed(773)
##D lp <- myfun(x1v,x2v)
##D p <- 1/(1+exp(-lp))
##D y <- rbinom(n=ndpts,size=1,p=p)     ## y is binary data
##D gmod <- bigssg(y~x1v*x2v,family="binomial",type=list(x1v="cub",x2v="cub"),nknots=50)
##D crossprod( lp - gmod$linear.predictor )/length(lp)
##D 
##D # binomial response (with weights)
##D set.seed(773)
##D lp <- myfun(x1v,x2v)
##D p <- 1/(1+exp(-lp))
##D w <- sample(c(10,20,30,40,50),length(p),replace=TRUE)
##D y <- rbinom(n=ndpts,size=w,p=p)/w   ## y is proportion correct
##D gmod <- bigssg(y~x1v*x2v,family="binomial",type=list(x1v="cub",x2v="cub"),nknots=50,weights=w)
##D crossprod( lp - gmod$linear.predictor )/length(lp)
##D 
##D # poisson response
##D set.seed(773)
##D lp <- myfun(x1v,x2v)
##D mu <- exp(lp)
##D y <- rpois(n=ndpts,lambda=mu)
##D gmod <- bigssg(y~x1v*x2v,family="poisson",type=list(x1v="cub",x2v="cub"),nknots=50)
##D crossprod( lp - gmod$linear.predictor )/length(lp)
##D 
##D # Gamma response
##D set.seed(773)
##D lp <- myfun(x1v,x2v)+6
##D mu <- 1/lp
##D y <- rgamma(n=ndpts,shape=4,scale=mu/4)
##D gmod <- bigssg(y~x1v*x2v,family="Gamma",type=list(x1v="cub",x2v="cub"),nknots=50)
##D 1/gmod$dispersion   ## dispersion = 1/shape
##D crossprod( lp - gmod$linear.predictor )/length(lp)
##D 
##D # inverse gaussian response (not run: requires 'statmod' package)
##D # require(statmod)
##D # set.seed(773)
##D # lp <- myfun(x1v,x2v)+6
##D # mu <- sqrt(1/lp)
##D # y <- rinvgauss(n=ndpts,mean=mu,shape=2)
##D # gmod <- bigssg(y~x1v*x2v,family="inverse.gaussian",type=list(x1v="cub",x2v="cub"),nknots=50)
##D # 1/gmod$dispersion   ## dispersion = 1/shape
##D # crossprod( lp - gmod$linear.predictor )/length(lp)
##D 
##D # negative binomial response (known dispersion)
##D set.seed(773)
##D lp <- myfun(x1v,x2v)
##D mu <- exp(lp)
##D y <- rnbinom(n=ndpts,size=.5,mu=mu)
##D gmod <- bigssg(y~x1v*x2v,family=list("negbin",2),type=list(x1v="cub",x2v="cub"),nknots=50)
##D 1/gmod$dispersion   ## dispersion = 1/size
##D crossprod( lp - gmod$linear.predictor )/length(lp)
##D 
##D # negative binomial response (unknown dispersion)
##D set.seed(773)
##D lp <- myfun(x1v,x2v)
##D mu <- exp(lp)
##D y <- rnbinom(n=ndpts,size=.5,mu=mu)
##D gmod <- bigssg(y~x1v*x2v,family="negbin",type=list(x1v="cub",x2v="cub"),nknots=50)
##D 1/gmod$dispersion   ## dispersion = 1/size
##D crossprod( lp - gmod$linear.predictor )/length(lp)
## End(Not run)




