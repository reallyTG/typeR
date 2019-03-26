library(SharpeR)


### Name: del_sropt
### Title: Create an 'del_sropt' object.
### Aliases: del_sropt
### Keywords: univar

### ** Examples

# roll your own.
ope <- 253

set.seed(as.integer(charToRaw("be determinstic")))
n.stock <- 10
X <- matrix(rnorm(1000*n.stock),nrow=1000)
Sigma <- cov(X)
mu <- colMeans(X)
w <- solve(Sigma,mu)
z <- t(mu) %*% w
n.sub <- 6
w.sub <- solve(Sigma[1:n.sub,1:n.sub],mu[1:n.sub])
z.sub <- t(mu[1:n.sub]) %*% w.sub
df1.sub <- n.stock - n.sub

roll.own <- del_sropt(z.s=z,z.sub=z.sub,df1=10,df2=1000,
 df1.sub=df1.sub,ope=ope)
print(roll.own)




