library(cherry)


### Name: Region class
### Title: Class "region" for storing the result of the region procedure
### Aliases: region region-class show,region-method summary,region-method
###   implications implications,region-method alpha,region-method pvalue
###   pvalue,region-method
### Keywords: methods

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
reg <- regionmethod(rep(1,p), mytest, isadjusted=TRUE, all_pvalues=TRUE)
summary(reg)

#what are the smallest regions that are found to be significant? 
implications(reg)

#what are the smallest regions that are found to be significant at an alpha-level of 0.03? 
implications(reg, alpha=0.03)

#what is the adjusted p-value of the overall null-hypothesis 
#(corresponding to the region ranging from 1 to 20)?
pvalue(reg,1,20)

#how many covariates within the full region of length 20 are at least associated with the response?
regionpick(reg, list(c(1,p)), alpha=0.05)

#visualize the results by either plotting a polygon corresponding to the underlying graph
regionplot(reg)

#or by plotting the graph itself
regionplot2(reg)



