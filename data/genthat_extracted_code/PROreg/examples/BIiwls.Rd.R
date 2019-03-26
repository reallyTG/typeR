library(PROreg)


### Name: BIiwls
### Title: Iterative Weighted Least Squares (IWLS) method for binomial
###   logistic regression
### Aliases: BIiwls

### ** Examples

# We create a variable and a matrix model that consists of
# two covariates.
k=1000                    
m=10 
maxiter=100

y <- rbinom(k,m,0.87) 
x1 <- rnorm(k,1,50)
x2 <- rnorm(k,30,9) 
X <- cbind(1,x1,x2)

BIiwls(y,X,m,maxiter)



