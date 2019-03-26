library(pscl)


### Name: simpi
### Title: Monte Carlo estimate of pi (3.14159265...)
### Aliases: simpi
### Keywords: misc

### ** Examples

seed <- round(pi*10000)  ## hah hah hah
m <- 6
z <- rep(NA,m)
lim <- rep(NA,m)
for(i in 1:m){
  cat(paste("simulation for ",i,"\n"))
  set.seed(seed)
  timings <- system.time(z[i] <- simpi(10^i))
  print(timings)
  cat("\n")
  lim[i] <- qbinom(prob=pi/4,size=10^i,.975)/10^i * 4
}

## convert to squared error
z <-(z - pi)^2
lim <- (lim - pi)^2

plot(x=1:m,
     y=z,
     type="b",
     pch=16,
     log="y",
     axes=FALSE,
     ylim=range(z,lim),
     xlab="Monte Carlo Samples",
     ylab="Log Squared Error")
lines(1:m,lim,col="blue",type="b",pch=1)
legend(x="topright",
       legend=c("95% bound",
         "Realized"),
       pch=c(1,16),
       lty=c(1,1),
       col=c("blue","black"),
       bty="n")
axis(1,at=1:m,
     labels=c(expression(10^{1}),
       expression(10^{2}),
       expression(10^{3}),
       expression(10^{4}),
       expression(10^{5}),
       expression(10^{6})))
axis(2)




