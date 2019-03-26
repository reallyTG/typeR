library(FRegSigCom)


### Name: cv.hd
### Title: Cross-validation for sparse linear function-on-function
###   regression with a large number of functional predictors
### Aliases: cv.hd

### ** Examples

#########################################
#toy example using the air quality data with p=1
#########################################
data(air)
t.x=seq(0,1,length=24)
t.y=seq(0,1,length=24)
air.cv=cv.hd(X=list(air[[2]][1:20,]), Y=air[[1]][1:20,], list(t.x), t.y,
             K.cv=2, s.n.basis = 8, t.n.basis = 8)
air.pred=pred.hd(air.cv, list(air[[2]][1:2,]))
predict.error=mean((air.pred-air[[1]][1:2,])^2)
print(c("predict error=", predict.error))


## No test: 
#########################################
#example with simulated data and p=200
#########################################

rm(list=ls())
ptm <- proc.time()
library(MASS)

n.curves=200 # total number of predictor curves.

t.x=seq(0,1,length.out=80) # observation points for X_i(s).
t.y=seq(0,1,length.out=100) # observation points for Y(t).
ntrain <- 100 # number of observations in training data
nnew <-50 # number of new observations
ntot <- ntrain+nnew
########################################
##generate the predictor curves using cos() basis functions.
############################################
W <- list()
for(j in 1:(n.curves+5))
{
  W[[j]] <- 0
  for(k in 1:30)
  W[[j]] <- W[[j]]+rnorm(ntot) %*% t(cos(k*pi*t.x))/k
}
X=lapply(1:n.curves,
function(k){(W[[k]]+W[[k+1]]+W[[k+2]]+W[[k+3]]+W[[k+4]]
             +W[[k+5]])/k})
########################################
##generate the coefficient functions. Only the first five are nonzero.
############################################
mu=sin(2*pi*t.y)
B.coef=list()
B.coef[[1]]=sapply(1:length(t.y), function(k){4*t.x^2*t.y[k]})
B.coef[[2]]=sapply(1:length(t.y), function(k){4*sin(pi*t.x)*cos(pi*t.y[k])})
B.coef[[3]]=sapply(1:length(t.y), function(k){4*exp(-((t.x-0.5)^2+(t.y[k]-0.5)^2)/2)})
B.coef[[4]]=sapply(1:length(t.y), function(k){4*t.x/(1+t.y[k]^2)})
B.coef[[5]]=sapply(1:length(t.y), function(k){4*log(1+t.x)*sqrt(t.y[k])})
########################################
##generate the response curves
############################################
Y=0
for(j in 1:5){
Y<- Y+ (X[[j]] %*% B.coef[[j]])/length(t.x)
}
E=sqrt(0.01)*matrix(rnorm(ntot*length(t.y)), ntot, length(t.y))
Y=rep(1,ntot)%*%t(mu)+Y+E
X.train=lapply(1:n.curves, function(k){X[[k]][(1:ntrain),]})
X.new=lapply(1:n.curves, function(k){X[[k]][-(1:ntrain),]})
Y.train <- Y[1:ntrain,]
Y.new <- Y[-(1:ntrain),]
E.new=E[-(1:ntrain),]

########################################
##fit the model using the sparse function-on-function method
############################################
t.x.list=lapply(1:n.curves, function(k){t.x})
fit.cv <- cv.hd(X.train, Y.train, t.x.list, t.y,   K.cv=5, s.n.basis=25, t.n.basis=40)
Y.pred=pred.hd(fit.cv, X.new)
predict.error=mean((Y.pred-Y.new)^2)
est.error=mean((Y.pred-Y.new+E.new)^2)
print(c("predict error=", predict.error))
print(c("estimation error=", est.error))
est.coefficient=getcoef.hd(fit.cv)
mu.est=est.coefficient[[1]]
beta.est=est.coefficient[[2]]
## End(No test)



