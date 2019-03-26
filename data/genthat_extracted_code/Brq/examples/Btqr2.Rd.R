library(Brq)


### Name: BLtqr
### Title: Bayesian tobit quantile regression
### Aliases: BLtqr

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

fit = Brq(y~0+x,tau=0.5, method="BLtqr",runs=5000, burn=1000)
summary(fit)
model(fit)



