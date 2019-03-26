library(hurdlr)


### Name: hurdle
### Title: Hurdle Model Count Data Regression
### Aliases: hurdle

### ** Examples

#Generate some data:
p=0.5; q=0.25; lam=3;
mu=10; sigma=7; xi=0.75;
n=200

set.seed(2016)
y <- rbinom(n,1,p)
nz <- sum(1-y)
extremes <- rbinom(sum(y),1,q)
ne <- sum(extremes)
nt <- n-nz-ne
yt <- sample(mu-1,nt,replace=TRUE,prob=dpois(1:(mu-1),3)/(ppois(mu-1,lam)-ppois(0,lam)))
yz <- round(rgpd(nz,mu,sigma,xi))
y[y==1] <- c(yt,yz)
g <- hurdle(y)















