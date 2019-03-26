library(irtProb)


### Name: m4pl
### Title: Multidimensional One, Two, Three and Four Person Parameters
###   Logistic Distributions
### Aliases: pm4pl dm4pl qm4pl rm4pl
### Keywords: distribution

### ** Examples

## ....................................................................
# Approximation of p4pl() by pm4pl()
 theta  <- 0
 S      <- 0; C <- 0; D <- 0
 a      <- 1.702; s <- sqrt(1/a^2); b <- 0; c <- 0; d <- 1
 p.4pl  <-  p4pl(theta,a=a,b,c,d);
 p.m4pl <- pm4pl(theta,S,C,D,s,b,c,d)
 print(c(p4pl=p.4pl, m4pl=p.m4pl))

# Comparison of p4pl() and pm4pl() according to diverse values of theta
#  while person parameters vary
 theta  <- seq(-4,4,length=100); N <- length(theta)
 S      <- rep(0.9,N); C <- rep(0,N); D <- rep(0.9,N)
 a      <- 1.702; s <- 1/1.702
 p.4pl  <- p4pl(theta=theta, a=a, b=b, c=c, d=d)
 p.m4pl <- pm4pl(theta=theta, S=S, C=C, D=D, s=s, b=b, c=c, d=d)
 print(c(difference.maximale = max(p.4pl - p.m4pl)))
 round(rbind(theta=theta, p4pl=p.4pl, m4pl=p.m4pl, dif=p.4pl-p.m4pl),3)
 plot(theta,p.4pl,type="l", col="black", ylab="Probability")
 lines(theta,p.m4pl,col="red"); max(p.4pl-p.m4pl)
 
# Recovery of probability by quantile
 pm4pl(theta=3,b=0); pm4pl(theta=qm4pl(p=0.20))

# Density function dm4pl()
# Comparison 01 between d4pl() and dm4pl()
 theta  <- seq(-4,4, length=100)
 # theta <- 0 # We can also experiment with an unique value of theta
 N      <- length(theta)
 S      <- rep(0,N); C <- rep(0,N); D <- rep(0,N)
 a      <- 1.702
 d.4pl  <- d4pl(theta=theta,a=a)
 d.m4pl <- dm4pl(theta=theta,S=0,s=1/a)
 stats  <- round(cbind(theta=theta, d4pl=d.4pl, m4pl=d.m4pl, dif=d.4pl-d.m4pl),3)
 print(stats)
 print(max(d.4pl - d.m4pl))
 plot(theta,d.4pl,type="l", col="black", ylab="Density")
 lines(theta,d.m4pl,col="red")

# Comparison 02 between d4pl() and dm4pl()
 theta  <- seq(-4,4, length=10)
 N      <- length(theta)
 S      <- rep(.3,N); C <- rep(0,N); D <- rep(0,N)
 a      <- 1.702
 d.4pl  <- d4pl(theta=theta,a=a)
 d.m4pl <- dm4pl(theta=theta, S=S, C=C, D=D, s=1/a)
 stats  <- round(cbind(theta=theta, d4pl=d.4pl, m4pl=d.m4pl, dif=d.4pl-d.m4pl),3)
 print(stats)
 print(max(d.4pl - d.m4pl))
 plot(theta,d.4pl,type="l", col="black", ylab="Density")
 lines(theta,d.m4pl,col="red")

# Comparison of q4pl and qm4pl
#  followed by recovery of quantiles
 pm4pl(theta=1, ); p4pl(theta=1, a=1.702)
 qm4pl(p=0.99,); q4pl(p=0.99, a=1.702)
 qm4pl(pm4pl(theta=1)); q4pl(p4pl(theta=1, a=1.702), a=1.702)
 qm4pl(p=pm4pl(theta=3))
 qm4pl(p=seq(0.01,0.99, length=10))

# Generation of theta values by rm4pl()
# ... Exemple 01 - A 4pl() equivalent distribution must be recovered when a=1.702
 res   <- rm4pl(N=1000)
 stats <- c(mean=sapply(res, mean), sd=sapply(res, sd), skewness=sapply(res, skewness),
            kurtosis=3-sapply(res, kurtosis))
 print(stats)
 # pdf of this distribution
 theta   <- seq(-4,4,length=100); C=rep(0,N); D=rep(0,N)
 density <- dm4pl(theta,C=C,D=D)
 plot(theta, density, type="l")

# ... Exemple 02 - Distribution with D != 0
 require(moments)
 S     <- 1/1.702
 B     <- 0
 C     <- 0.00
 D     <- 0.90
 res   <- rm4pl(N=1000, S=S, C=C, D=D)
 stats <- c(mean=sapply(res, mean), sd=sapply(res, sd), skewness=sapply(res, skewness),
            kurtosis=3-sapply(res, kurtosis))
 print(stats)
 # pdf of this distribution
 theta   <- seq(-4,4,length=100)
 density <- dm4pl(theta, S=S, C=C, D=D)
 print(c(max=max(density)))
 plot(theta, density, type="l")
## ....................................................................
 


