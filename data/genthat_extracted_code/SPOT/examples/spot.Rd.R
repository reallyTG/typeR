library(SPOT)


### Name: spot
### Title: Sequential Parameter Optimization
### Aliases: spot

### ** Examples

## Most simple example: Kriging + LHS + predicted 
## mean optimization (not expected improvement)
res <- spot(,funSphere,c(-2,-3),c(1,2))
res$xbest
## With expected improvement
res <- spot(,funSphere,c(-2,-3),c(1,2),
   control=list(modelControl=list(target="ei"))) 
res$xbest
### With additional start point:
#res <- spot(matrix(c(0.05,0.1),1,2),funSphere,c(-2,-3),c(1,2))
#res$xbest
#res <- spot(,funSphere,c(-2,-3),c(1,2),
#    control=list(funEvals=50)) 
#res$xbest
### Use a local optimizer instead of LHS
#res <- spot(,funSphere,c(-2,-3),c(1,2),
#    control=list(optimizer=optimLBFGSB)) 
#res$xbest
### Random Forest instead of Kriging
#res <- spot(,funSphere,c(-2,-3),c(1,2),
#    control=list(model=buildRandomForest)) 
#res$xbest    
### LM instead of Kriging
#res <- spot(,funSphere,c(-2,-3),c(1,2),
#    control=list(model=buildLM)) #lm as surrogate
#res$xbest
### LM and local optimizer (which for this simple example is perfect)
#res <- spot(,funSphere,c(-2,-3),c(1,2),
#    control=list(model=buildLM, optimizer=optimLBFGSB)) 
#res$xbest
### Or a different Kriging model:
#res <- spot(,funSphere,c(-2,-3),c(1,2),
#    control=list(model=buildKrigingDACE, optimizer=optimLBFGSB)) 
#res$xbest
## With noise: (this takes some time)
#res1 <- spot(,function(x)funSphere(x)+rnorm(nrow(x)),c(-2,-3),c(1,2),
#		control=list(funEvals=100,noise=TRUE)) #noisy objective
#res2 <- spot(,function(x)funSphere(x)+rnorm(nrow(x)),c(-2,-3),c(1,2),
#		control=list(funEvals=100,noise=TRUE,replicates=2,
#		designControl=list(replicates=2))) #noise with replicated evaluations
#res3 <- spot(,function(x)funSphere(x)+rnorm(nrow(x)),c(-2,-3),c(1,2),
#		control=list(funEvals=100,noise=TRUE,replicates=2,OCBA=T,OCBABudget=1,
#		designControl=list(replicates=2))) #and with OCBA
### Check results with non-noisy function:
#funSphere(res1$xbest)
#funSphere(res2$xbest)
#funSphere(res3$xbest)
## The following is for demonstration only, to be used for random number 
## seed handling in case of external noisy target functions.
#res3 <- spot(,function(x,seed){set.seed(seed);funSphere(x)+rnorm(nrow(x))},
#    c(-2,-3),c(1,2),control=list(funEvals=100,noise=TRUE,seedFun=1))
## 
## Next Example: Handling factor variables
## Note: factors should be coded as integer values, i.e., 1,2,...,n
## create a test function:
braninFunctionFactor <- function (x) {  
  y <- (x[2]  - 5.1/(4 * pi^2) * (x[1] ^2) + 5/pi * x[1]  - 6)^2 + 
    10 * (1 - 1/(8 * pi)) * cos(x[1] ) + 10
  if(x[3]==1)
    y <- y +1
  else if(x[3]==2)
    y <- y -1
  y  
}
## vectorize
objFun <- function(x){apply(x,1,braninFunctionFactor)}
set.seed(1)
res <- spot(fun=objFun,lower=c(-5,0,1),upper=c(10,15,3),     
    control=list(model=buildKriging, 
      types= c("numeric","numeric","factor"), 
      optimizer=optimLHD)) 
res$xbest
res$ybest



