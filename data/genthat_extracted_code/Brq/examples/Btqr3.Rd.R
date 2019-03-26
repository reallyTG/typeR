library(Brq)


### Name: BALtqr
### Title: Bayesian adaptive Lasso tobit quantile regression
### Aliases: BALtqr

### ** Examples

# Example 
n <- 150
p=8
Beta=c(5, 0, 0, 0, 0, 0, 0, 0)
x <- matrix(rnorm(n=p*n),n)
x=scale(x)
y <-x%*%Beta+rnorm(n)
y=y-mean(y)
y=pmax(0, y)

fit = Brq(y~0+x,tau=0.5, method="BALtqr",runs=5000, burn=1000)
summary(fit)
model(fit)



