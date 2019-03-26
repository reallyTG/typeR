library(stable)


### Name: stable
### Title: Stable Distribution
### Aliases: dstable pstable qstable hstable rstable
### Keywords: distribution

### ** Examples

par(mfrow=c(2,2))
x <- seq(-5,5,by=0.1)

# Influence of loc (location)
plot(x,dstable(x,loc=-2,disp=1/sqrt(2),skew=-0.8,tail=1.5),
  type="l",ylab="",main="Varying LOCation")
lines(x,dstable(x,loc=0,disp=1/sqrt(2),skew=-0.8,tail=1.5))
lines(x,dstable(x,loc=2,disp=1/sqrt(2),skew=-0.8,tail=1.5))

# Influence of disp (dispersion)
plot(x,dstable(x,loc=0,disp=0.5,skew=0,tail=1.5),
  type="l",ylab="",main="Varying DISPersion")
lines(x,dstable(x,loc=0,disp=1/sqrt(2),skew=0,tail=1.5))
lines(x,dstable(x,loc=0,disp=0.9,skew=0,tail=1.5))

# Influence of skew (skewness)
plot(x,dstable(x,loc=0,disp=1/sqrt(2),skew=-0.8,tail=1.5),
  type="l",ylab="",main="Varying SKEWness")
lines(x,dstable(x,loc=0,disp=1/sqrt(2),skew=0,tail=1.5))
lines(x,dstable(x,loc=0,disp=1/sqrt(2),skew=0.8,tail=1.5))

# Influence of tail (tail)
plot(x,dstable(x,loc=0,disp=1/sqrt(2),skew=0,tail=0.8),
  type="l",ylab="",main="Varying TAIL thickness")
lines(x,dstable(x,loc=0,disp=1/sqrt(2),skew=0,tail=1.5))
lines(x,dstable(x,loc=0,disp=1/sqrt(2),skew=0,tail=2))



