library(ifs)


### Name: ifs.FT
### Title: IFS estimator
### Aliases: ifs.FT ifs.setup.FT ifs.pf.FT ifs.df.FT IFS.pf.FT IFS.df.FT
### Keywords: distribution

### ** Examples

require(ifs)


nobs <- 100
y<-rbeta(nobs,2,4)

# uncomment if you want to test the normal distribution
# y<-sort(rnorm(nobs,3,1))/6


IFS.est <- IFS(y)
xx <- IFS.est$x
tt <- IFS.est$y

ss <- pbeta(xx,2,4)

# uncomment if you want to test the normal distribution   
# ss <- pnorm(6*xx-3)
     
par(mfrow=c(3,1))   
  
plot(ecdf(y),xlim=c(0,1),main="IFS estimator versus EDF")
lines(xx,ss,col="blue")
lines(IFS.est,col="red")
IFS.FT.est <- IFS.pf.FT(y)
xxx <- IFS.FT.est$x
uuu <- IFS.FT.est$y
sss <- pbeta(xxx,2,4)
# uncomment if you want to test the normal distribution   
# sss <- pnorm(6*xxx-3)

lines(IFS.FT.est,col="green")


# calculates MSE


ww <- ecdf(y)(xx)
mean((ww-ss)^2)
mean((tt-ss)^2)
mean((uuu-sss)^2)

plot(xx,(ww-ss)^2,main="MSE",type="l",xlab="x",ylab="MSE(x)")
lines(xx,(tt-ss)^2,col="red")
lines(xxx,(uuu-sss)^2,col="green")

plot(IFS.df.FT(y),type="l",col="green",ylim=c(0,3),main="IFS vs Kernel")
lines(density(y),col="blue")
curve(dbeta(x,2,4),0,1,add=TRUE)
# uncomment if you want to test the normal distribution   
# curve(6*dnorm(x*6-3,0,1),0,1,add=TRUE)



