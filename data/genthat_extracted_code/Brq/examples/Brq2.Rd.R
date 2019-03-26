library(Brq)


### Name: BLqr
### Title: Bayesian Lasso quantile regression
### Aliases: BLqr

### ** Examples

# Example 
n <- 150
p=8
Beta=c(5, 0, 0, 0, 0, 0, 0, 0)
x <- matrix(rnorm(n=p*n),n)
x=scale(x)
y <-x%*%Beta+rnorm(n)
y=y-mean(y)

fit = Brq(y~0+x,tau=0.5, method="BLqr",runs=5000, burn=1000)
summary(fit)
model(fit)



