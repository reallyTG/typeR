library(selectiveInference)


### Name: fixedLassoInf
### Title: Inference for the lasso, with a fixed lambda
### Aliases: fixedLassoInf

### ** Examples

set.seed(43)
n = 50
p = 10
sigma = 1

x = matrix(rnorm(n*p),n,p)
x=scale(x,TRUE,TRUE)

beta = c(3,2,rep(0,p-2))
y = x%*%beta + sigma*rnorm(n)

# first run glmnet
gfit = glmnet(x,y,standardize=FALSE)

# extract coef for a given lambda; note the 1/n factor!
# (and we don't save the intercept term)
lambda = .8
beta = coef(gfit, s=lambda/n, exact=TRUE,x=x,y=y)[-1]

# compute fixed lambda p-values and selection intervals
out = fixedLassoInf(x,y,beta,lambda,sigma=sigma)
out


## as above, but use lar function instead to get initial 
## lasso fit (should get same results)
 lfit = lar(x,y,normalize=FALSE)
 beta = coef(lfit,s=lambda,mode="lambda",x=x,y=y)
 out2 = fixedLassoInf(x,y,beta,lambda,sigma=sigma)
 out2

## mimic different penalty factors by first scaling x
 set.seed(43)
n = 50
p = 10
sigma = 1

x = matrix(rnorm(n*p),n,p)
x=scale(x,TRUE,TRUE)

beta = c(3,2,rep(0,p-2))
y = x%*%beta + sigma*rnorm(n)
pf=c(rep(1,7),rep(.1,3))  #define penalty factors
pf=p*pf/sum(pf)   # penalty factors should be rescaled so they sum to p
xs=scale(x,FALSE,pf) #scale cols of x by penalty factors
# first run glmnet
gfit = glmnet(xs,y,standardize=FALSE)

# extract coef for a given lambda; note the 1/n factor!
# (and we don't save the intercept term)
lambda = .8
beta_hat = coef(gfit, s=lambda/n, exact=TRUE,x=x,y=y)[-1]

# compute fixed lambda p-values and selection intervals
out = fixedLassoInf(xs,y,beta_hat,lambda,sigma=sigma)

#rescale conf points to undo the penalty factor
out$ci=t(scale(t(out$ci),FALSE,pf[out$vars]))
out

#logistic model
set.seed(43)
     n = 50
     p = 10
     sigma = 1
     
     x = matrix(rnorm(n*p),n,p)
     x=scale(x,TRUE,TRUE)
     
     beta = c(3,2,rep(0,p-2))
     y = x%*%beta + sigma*rnorm(n)
     y=1*(y>mean(y))
     # first run glmnet
     gfit = glmnet(x,y,standardize=FALSE,family="binomial")
     
     # extract coef for a given lambda; note the 1/n factor!
     # (and here  we DO  include the intercept term)
     lambda = .8
     beta_hat = coef(gfit, s=lambda/n, exact=TRUE,x=x,y=y)
     
     # compute fixed lambda p-values and selection intervals
     out = fixedLassoInf(x,y,beta_hat,lambda,family="binomial")
     out

#Cox model
set.seed(43)
     n = 50
     p = 10
     sigma = 1
     
     x = matrix(rnorm(n*p),n,p)
     x=scale(x,TRUE,TRUE)
     
     beta = c(3,2,rep(0,p-2))
     tim = as.vector(x%*%beta + sigma*rnorm(n))
     tim= tim-min(tim)+1
status=sample(c(0,1),size=n,replace=TRUE)
     # first run glmnet


     gfit = glmnet(x,Surv(tim,status),standardize=FALSE,family="cox")
   
     # extract coef for a given lambda; note the 1/n factor!
   
     lambda = 1.5
     beta_hat = as.numeric(coef(gfit, s=lambda/n, exact=TRUE,x=x,y=Surv(tim,status)))
     
     # compute fixed lambda p-values and selection intervals
     out = fixedLassoInf(x,tim,beta_hat,lambda,status=status,family="cox")
     out



