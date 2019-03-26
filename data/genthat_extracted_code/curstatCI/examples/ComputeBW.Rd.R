library(curstatCI)


### Name: ComputeBW
### Title: Data-driven bandwidth vector
### Aliases: ComputeBW

### ** Examples

library(Rcpp)
library(curstatCI)

# sample size
n <- 1000

# truncated exponential distribution on (0,2)
set.seed(100)
t <- rep(NA, n)
delta <- rep(NA, n)
for(i in (1:n) ){
  x<-runif(1)
  y<--log(1-(1-exp(-2))*x)
  t[i]<-2*runif(1);
  if(y<=t[i]){ delta[i]<-1}
  else{delta[i]<-0}}

A<-cbind(t[order(t)], delta[order(t)], rep(1,n))

# x vector
grid<-seq(0.1,1.9 ,by = 0.1)

# data-driven bandwidth vector
bw <- ComputeBW(data =A, x = grid)
plot(grid, bw)




