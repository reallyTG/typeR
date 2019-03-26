library(emdbook)


### Name: dbetabinom
### Title: Beta-binomial distribution
### Aliases: BetaBinomial dbetabinom rbetabinom
### Keywords: distribution

### ** Examples

  set.seed(100)
  n <- 9
  z <- rbetabinom(1000, 0.5, size=n, theta=4)
  par(las=1,bty="l")
  plot(table(z)/length(z),ylim=c(0,0.34),col="gray",lwd=4,
       ylab="probability")
  points(0:n,dbinom(0:n,size=n,prob=0.5),col=2,pch=16,type="b")
  points(0:n,dbetabinom(0:n,size=n,theta=4,
           prob=0.5),col=4,pch=17,type="b")
  ## correspondence with SuppDists 
  if (require(SuppDists)) {
    d1a <- dghyper(0:5,a=-5,N=-10,k=5)
    d1b <- dbetabinom(0:5,shape1=5,shape2=5,size=5)
    max(abs(d1a-d1b))
    p1a <- pghyper(0:5,a=-5,N=-10,k=5,lower.tail=TRUE)
    p1b <- cumsum(d1b)
    max(abs(p1a-p1b))
  } 



