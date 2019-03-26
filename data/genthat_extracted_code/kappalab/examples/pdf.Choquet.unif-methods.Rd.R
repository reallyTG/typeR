library(kappalab)


### Name: pdf.Choquet.unif-methods
### Title: Distribution of the Choquet integral for evaluations uniformly
###   distributed on the unit hypercube
### Aliases: pdf.Choquet.unif cdf.Choquet.unif pdf.Choquet.unif-methods
###   cdf.Choquet.unif-methods pdf.Choquet.unif,game,numeric-method
###   cdf.Choquet.unif,game,numeric-method
### Keywords: methods

### ** Examples


## a capacity
mu <- capacity(c(0,0.1,0.6,rep(0.9,4),1))
## the cdf of the Choquet integral at 0.7
cdf.Choquet.unif(mu,0.7)

## the same but empirically
m <- 10000
ch <- numeric(m)
for (i in 1:m) {
     f <- runif(3) 
     ch[i] <- Choquet.integral(mu,f)
}
sum(ifelse(ch<=0.7,1,0))/m



