library(cherry)


### Name: regionpick
### Title: Confidence limits for the number of false hypotheses in a given
###   region.
### Aliases: regionpick

### ** Examples


#generate data, where the response Y is associated with certain groups of covariates
#namely cov 3-6, 9-12, 15-18
set.seed(1)
n=100
p=20
X <- matrix(rnorm(n*p),n,p)
beta <- c(rep(0,2),rep(1,4),rep(0,2),rep(1,4),rep(0,2),rep(1,4),rep(0,2))
Y <- X %*% beta + rnorm(n)

# Define the local test to be used in the closed testing procedure
mytest <- function(left,right)
{
  X <- X[,(left:right),drop=FALSE]
  lm.out <- lm(Y ~ X)
  x <- summary(lm.out)
  return(pf(x$fstatistic[1],x$fstatistic[2],x$fstatistic[3],lower.tail=FALSE))  
}

# perform the region procedure
reg <- regionmethod(rep(1,p), mytest, isadjusted=TRUE)
summary(reg)

#what are the smallest regions that are found to be significant? 
implications(reg)

#how many covariates within the full region of length 20 are at least associated with the response?
regionpick(reg, list(c(1,p)), alpha=0.05)

#how many covariates within the two subregions, (1,5) and (16,20) 
#are at least associated with the response?
regionpick(reg, list(c(1,5),c(16,20)))




