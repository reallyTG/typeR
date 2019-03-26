library(lava)


### Name: constrain<-
### Title: Add non-linear constraints to latent variable model
### Aliases: constrain<- constrain constrain.default constrain<-.multigroup
###   constrain<-.default constraints parameter<-
### Keywords: models regression

### ** Examples

##############################
### Non-linear parameter constraints 1
##############################
m <- lvm(y ~ f(x1,gamma)+f(x2,beta))
covariance(m) <- y ~ f(v)
d <- sim(m,100)
m1 <- m; constrain(m1,beta ~ v) <- function(x) x^2
## Define slope of x2 to be the square of the residual variance of y
## Estimate both restricted and unrestricted model
e <- estimate(m,d,control=list(method="NR"))
e1 <- estimate(m1,d)
p1 <- coef(e1)
p1 <- c(p1[1:2],p1[3]^2,p1[3])
## Likelihood of unrestricted model evaluated in MLE of restricted model
logLik(e,p1)
## Likelihood of restricted model (MLE)
logLik(e1)

##############################
### Non-linear regression
##############################

## Simulate data
m <- lvm(c(y1,y2)~f(x,0)+f(eta,1))
latent(m) <- ~eta
covariance(m,~y1+y2) <- "v"
intercept(m,~y1+y2) <- "mu"
covariance(m,~eta) <- "zeta"
intercept(m,~eta) <- 0
set.seed(1)
d <- sim(m,100,p=c(v=0.01,zeta=0.01))[,manifest(m)]
d <- transform(d,
               y1=y1+2*pnorm(2*x),
               y2=y2+2*pnorm(2*x))

## Specify model and estimate parameters
constrain(m, mu ~ x + alpha + nu + gamma) <- function(x) x[4]*pnorm(x[3]+x[1]*x[2])
## No test: 
 ## Reduce Ex.Timings
e <- estimate(m,d,control=list(trace=1,constrain=TRUE))
constraints(e,data=d)
## Plot model-fit
plot(y1~x,d,pch=16); points(y2~x,d,pch=16,col="gray")
x0 <- seq(-4,4,length.out=100)
lines(x0,coef(e)["nu"] + coef(e)["gamma"]*pnorm(coef(e)["alpha"]*x0))
## End(No test)

##############################
### Multigroup model
##############################
### Define two models
m1 <- lvm(y ~ f(x,beta)+f(z,beta2))
m2 <- lvm(y ~ f(x,psi) + z)
### And simulate data from them
d1 <- sim(m1,500)
d2 <- sim(m2,500)
### Add 'non'-linear parameter constraint
constrain(m2,psi ~ beta2) <- function(x) x
## Add parameter beta2 to model 2, now beta2 exists in both models
parameter(m2) <- ~ beta2
ee <- estimate(list(m1,m2),list(d1,d2),control=list(method="NR"))
summary(ee)

m3 <- lvm(y ~ f(x,beta)+f(z,beta2))
m4 <- lvm(y ~ f(x,beta2) + z)
e2 <- estimate(list(m3,m4),list(d1,d2),control=list(method="NR"))
e2



