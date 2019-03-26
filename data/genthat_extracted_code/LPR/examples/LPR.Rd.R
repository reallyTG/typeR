library(LPR)


### Name: LPR
### Title: Lasso and Partial Ridge
### Aliases: LPR PartRidge ci escv.glmnet mls mylasso mylassomls

### ** Examples

#generate dataset	
set.seed(2015)
n <- 100    
p <- 250
B <- 100
s <- 10
rho <- 0.5
z <- matrix(rnorm(n*p),ncol=p)
x <- matrix(0,n,p)
x[,1] <- z[,1]
for(j in 2:p){
  x[,j] <- rho*x[,j-1]+sqrt(1-rho^2)*z[,j]
}

#beta is decaying
beta <- rep(0,p)
ind.s <- sample(1:p,s)
beta[ind.s] <- rnorm(s,1,sqrt(0.001))
for( j in setdiff(1:p,ind.s) ){
  beta[j]<-1/(j+3)^2
}
#generate y
epsilon <- rep(0,n)
epsilon <- rnorm(n,0,0.1)
y <- x%*%beta + epsilon
#use LPR
LPR.obj <- LPR(x, y, 1/n, B, type.boot="paired", alpha=0.05)



