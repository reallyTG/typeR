library(spc)


### Name: xewma.sf.prerun
### Title: Compute the survival function of EWMA run length in case of
###   estimated parameters
### Aliases: xewma.sf.prerun
### Keywords: ts

### ** Examples

## Jones/Champ/Rigdon (2001)

c4m <- function(m, n) sqrt(2)*gamma( (m*(n-1)+1)/2 )/sqrt( m*(n-1) )/gamma( m*(n-1)/2 )

n <- 5 # sample size

# Figure 6, subfigure r=0.1
lambda <- 0.1
L <- 2.454

CDF0 <- 1 - xewma.sf(lambda, L, 0, 600, sided="two")
m <- 10 # pre run size
CDF1 <- 1 - xewma.sf.prerun(lambda, L/c4m(m,n), 0, 600, sided="two",
size=m, df=m*(n-1), estimated="both")
m <- 20
CDF2 <- 1 - xewma.sf.prerun(lambda, L/c4m(m,n), 0, 600, sided="two",
size=m, df=m*(n-1), estimated="both")
m <- 50
CDF3 <- 1 - xewma.sf.prerun(lambda, L/c4m(m,n), 0, 600, sided="two",
size=m, df=m*(n-1), estimated="both")

plot(CDF0, type="l", xlab="t", ylab=expression(P(T<=t)), xlim=c(0,500), ylim=c(0,1))
abline(v=0, h=c(0,1), col="grey", lwd=.7)
points((1:5)*100, CDF0[(1:5)*100], pch=18)
lines(CDF1, col="blue")
points((1:5)*100, CDF1[(1:5)*100], pch=2, col="blue")
lines(CDF2, col="red")
points((1:5)*100, CDF2[(1:5)*100], pch=16, col="red")
lines(CDF3, col="green")
points((1:5)*100, CDF3[(1:5)*100], pch=5, col="green")

legend("bottomright", c("Known", "m=10, n=5", "m=20, n=5", "m=50, n=5"),
       col=c("black", "blue", "red", "green"), pch=c(18, 2, 16, 5), lty=1)



