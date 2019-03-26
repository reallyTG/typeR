library(mixtools)


### Name: tauequivnormalmixEM
### Title: Special EM Algorithm for three-component tau equivalence model
### Aliases: tauequivnormalmixEM
### Keywords: file

### ** Examples

## Analyzing synthetic data as in the tau equivalent model  
## From Thomas et al (2011), see also Chauveau and Hunter (2013)
## a 3-component mixture of normals with linear constraints.
lbd <- c(0.6,0.3,0.1); m <- length(lbd)
sigma <- sig0 <- sqrt(c(1,9,9))
# means constaints mu = M beta
M <- matrix(c(1,1,1,0,1,-1), 3, 2)
beta <- c(1,5) # unknown constained mean
mu0 <- mu <- as.vector(M %*% beta)
# linear constraint on the inverse variances pi = A.g
A <- matrix(c(1,1,1,0,1,0), m, 2, byrow=TRUE)
iv0 <- 1/(sig0^2)
g0 <- c(iv0[2],iv0[1] - iv0[2]) # gamma^0 init 

# simulation and EM fits
set.seed(40); n=100; x <- rnormmix(n,lbd,mu,sigma)
s <- normalmixEM(x,mu=mu0,sigma=sig0,maxit=2000) # plain EM
# EM with var and mean linear constraints
sc <- normalmixMMlc(x, lambda=lbd, mu=mu0, sigma=sig0,
					mean.lincstr=M, var.lincstr=A, gparam=g0)
# Using tauequivnormalmixEM function to call normalmixMMlc					
tau <- tauequivnormalmixEM (x, lambda=lbd, mu=mu0, gparam=g0)
# plot and compare both estimates
dnormmixt <- function(t, lam, mu, sig){
	m <- length(lam); f <- 0
	for (j in 1:m) f <- f + lam[j]*dnorm(t,mean=mu[j],sd=sig[j])
	f}
t <- seq(min(x)-2, max(x)+2, len=200)
hist(x, freq=FALSE, col="lightgrey", 
		ylim=c(0,0.3), ylab="density",main="")
lines(t, dnormmixt(t, lbd, mu, sigma), col="darkgrey", lwd=2) # true
lines(t, dnormmixt(t, s$lambda, s$mu, s$sigma), lty=2) 
lines(t, dnormmixt(t, sc$lambda, sc$mu, sc$sigma), col=1, lty=3)
lines(t, dnormmixt(t, tau$lambda, tau$mu, tau$sigma), col=2, lty=4)
legend("topleft", c("true","plain EM","constr EM", "Tau Equiv"), 
	col=c("darkgrey",1,1,2), lty=c(1,2,3,4), lwd=c(2,1,1,1))



