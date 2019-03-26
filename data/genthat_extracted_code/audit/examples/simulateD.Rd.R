library(audit)


### Name: simulateD
### Title: Simulating the Total Error in the Accounts
### Aliases: simulateD
### Keywords: misc

### ** Examples

y <- rgamma(500,5)
x <- y
dum <- sample(1:500,50)
x[dum] <- x[dum]*runif(50,.05,0.5)
smp <- sample(1:500,40)
quantile(simulateD(y[smp],x[smp],y[-smp],40,1,1,1000),0.95)



