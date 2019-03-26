library(spc)


### Name: xewma.arl.prerun
### Title: Compute ARLs of EWMA control charts in case of estimated
###   parameters
### Aliases: xewma.arl.prerun xewma.crit.prerun
### Keywords: ts

### ** Examples

## Jones/Champ/Rigdon (2001)

c4m <- function(m, n) sqrt(2)*gamma( (m*(n-1)+1)/2 )/sqrt( m*(n-1) )/gamma( m*(n-1)/2 )

n <- 5 # sample size
m <- 20 # pre run with 20 samples of size n = 5
C4m <- c4m(m, n) # needed for bias correction

# Table 1, 3rd column
lambda <- 0.2
L <- 2.636

xewma.ARL <- Vectorize("xewma.arl", "mu")
xewma.ARL.prerun <- Vectorize("xewma.arl.prerun", "mu")

mu <- c(0, .25, .5, 1, 1.5, 2)
ARL <- round(xewma.ARL(lambda, L, mu, sided="two"), digits=2)
p.ARL <- round(xewma.ARL.prerun(lambda, L/C4m, mu, sided="two",
size=m, df=m*(n-1), estimated="both", qm.mu=70), digits=2)

# Monte-Carlo with 10^8 repetitions: 200.325 (0.020) and 144.458 (0.022)
cbind(mu, ARL, p.ARL)

## Not run: 
##D # Figure 5, subfigure r = 0.2
##D mu_ <- (0:85)/40
##D ARL_ <- round(xewma.ARL(lambda, L, mu_, sided="two"), digits=2)
##D p.ARL_ <- round(xewma.ARL.prerun(lambda, L/C4m, mu_, sided="two",
##D size=m, df=m*(n-1), estimated="both"), digits=2)
##D 
##D plot(mu_, ARL_, type="l", xlab=expression(delta), ylab="ARL", xlim=c(0,2))
##D abline(v=0, h=0, col="grey", lwd=.7)
##D points(mu, ARL, pch=5)
##D lines(mu_, p.ARL_, col="blue")
##D points(mu, p.ARL, pch=18, col ="blue")
##D legend("topright", c("Known", "Estimated"), col=c("black", "blue"),
##D lty=1, pch=c(5, 18))
## End(Not run)



