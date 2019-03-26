library(selectiveInference)


### Name: selectiveInference
### Title: Tools for selective inference
### Aliases: selectiveInference
### Keywords: package

### ** Examples

set.seed(33)
n = 50
p = 10
sigma = 1
x = matrix(rnorm(n*p),n,p)
beta = c(3,2,rep(0,p-2))
y = x%*%beta + sigma*rnorm(n)

# run forward stepwise
fsfit = fs(x,y)

# compute sequential p-values and confidence intervals
# (sigma estimated from full model)
out.seq = fsInf(fsfit)
out.seq

# compute p-values and confidence intervals after AIC stopping
out.aic = fsInf(fsfit,type="aic")
out.aic

# compute p-values and confidence intervals after 5 fixed steps
out.fix = fsInf(fsfit,type="all",k=5)
out.fix

## NOT RUN---lasso at fixed lambda- Gaussian family
## first run glmnet
# gfit = glmnet(x,y)

## extract coef for a given lambda; note the 1/n factor!
## (and we don't save the intercept term)
# lambda = .1
# beta = coef(gfit, s=lambda/n, exact=TRUE)[-1]

## compute fixed lambda p-values and selection intervals
# out = fixedLassoInf(x,y,beta,lambda,sigma=sigma)
# out


#lasso at fixed lambda- logistic family
#set.seed(43)
  #   n = 50
  #   p = 10
  #   sigma = 1
     
 #    x = matrix(rnorm(n*p),n,p)
     x=scale(x,TRUE,TRUE)
  #   
#     beta = c(3,2,rep(0,p-2))
 #    y = x%*%beta + sigma*rnorm(n)
 #    y=1*(y>mean(y))
     # first run glmnet
 #    gfit = glmnet(x,y,standardize=FALSE,family="binomial")
     
     # extract coef for a given lambda; note the 1/n factor!
     # (and here  we DO  include the intercept term)
 #    lambda = .8
 #    beta = coef(gfit, s=lambda/n, exact=TRUE)
     
 #    # compute fixed lambda p-values and selection intervals
 #    out = fixedLassoInf(x,y,beta,lambda,family="binomial")
 #    out

##lasso at fixed lambda- Cox family
#set.seed(43)
#     n = 50
 #    p = 10
 #    sigma = 1
     
 #    x = matrix(rnorm(n*p),n,p)
  #   x=scale(x,TRUE,TRUE)
     
 #    beta = c(3,2,rep(0,p-2))
 #    tim = as.vector(x%*%beta + sigma*rnorm(n))
  #   tim= tim-min(tim)+1
#status=sample(c(0,1),size=n,replace=T)
     # first run glmnet
   #  gfit = glmnet(x,Surv(tim,status),standardize=FALSE,family="cox")
     # extract coef for a given lambda; note the 1/n factor!
   
  #   lambda = 1.5
  #   beta = as.numeric(coef(gfit, s=lambda/n, exact=TRUE))
     
     # compute fixed lambda p-values and selection intervals
   #  out = fixedLassoInf(x,tim,beta,lambda,status=status,family="cox")
   #  out
## NOT RUN---many normal means
# set.seed(12345)
# n = 100 
# mu = c(rep(3,floor(n/5)), rep(0,n-floor(n/5))) 
# y = mu + rnorm(n)
# out = manyMeans(y, bh.q=0.1)
# out

## NOT RUN---forward stepwise with groups
# set.seed(1)
# n = 20
# p = 40
# x = matrix(rnorm(n*p), nrow=n)
# index = sort(rep(1:(p/2), 2))
# y = rnorm(n) + 2 * x[,1] - x[,4]
# fit = groupfs(x, y, index, maxsteps = 5)
# out = groupfsInf(fit)
# out

## NOT RUN---estimation of sigma for use in fsInf
## (or larInf or fixedLassoInf)
# set.seed(33)
# n = 50
# p = 10
# sigma = 1
# x = matrix(rnorm(n*p),n,p)
# beta = c(3,2,rep(0,p-2))
# y = x%*%beta + sigma*rnorm(n)

## run forward stepwise
# fsfit = fs(x,y)

## estimate sigma
# sigmahat = estimateSigma(x,y)$sigmahat

## run sequential inference with estimated sigma
# out = fsInf(fit,sigma=sigmahat)
# out



