library(ifs)


### Name: ifs
### Title: IFS estimator
### Aliases: ifs ifs.flex IFS
### Keywords: nonparametric

### ** Examples

require(ifs)


y<-rbeta(50,.5,.1)

# uncomment if you want to test the normal distribution
# y<-sort(rnorm(50,3,1))/6


IFS.est <- IFS(y)
xx <- IFS.est$x
tt <- IFS.est$y

ss <- pbeta(xx,.5,.1)

# uncomment if you want to test the normal distribution   
# ss <- pnorm(6*xx-3)
     
par(mfrow=c(2,1))   
  
plot(ecdf(y),xlim=c(0,1),main="IFS estimator versus EDF")
lines(xx,ss,col="blue")
lines(xx,tt,col="red")


# calculates MSE


ww <- ecdf(y)(xx)
mean((ww-ss)^2)
mean((tt-ss)^2)

plot(xx,(ww-ss)^2,main="MSE",type="l",xlab="x",ylab="MSE(x)")
lines(xx,(tt-ss)^2,col="red")



