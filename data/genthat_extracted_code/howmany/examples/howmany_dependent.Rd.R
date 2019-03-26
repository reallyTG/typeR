library(howmany)


### Name: howmany_dependent
### Title: Number of correct rejections, for dependent test statistics
### Aliases: howmany_dependent
### Keywords: htest

### ** Examples


## Warning: running example might take a
## few minutes of computing time...

## create observation matrix X 
## for p=200 hypotheses with n=40 observations
p <- 200
n <- 40
Indep <- matrix( rnorm(p*n) , ncol= p )  
C <- diag(p); C <- C+matrix( 0.01*rbinom(p^2,1,0.2) , ncol=p ) 
X <- Indep%*%C

## create binary class variables Y
Y <- c( rep(0,round(n/2)), rep(1,n-round(n/2)) )

## 100 false null hypotheses (random effects)
for (k in 1:100){  X[Y==1, k] <- X[Y==1, k] + rnorm(1) }



## compute object of class 'howmany' and print the result
(object <- howmany_dependent(X,Y))

## extract the lower bound
(lower <- lowerbound(object))

## plot the result
plot(object)

## for comparison: number of rejections with Bonferroni correction
(bonf <- sum(object$pvalues<0.05/p))




