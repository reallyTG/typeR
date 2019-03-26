library(NPsimex)


### Name: simex.H.density
### Title: Estimating probability density function from data with
###   heteroscedastic measurement error using SIMEX
### Aliases: simex.H.density
### Keywords: nonparametric smooth density estimation measurement error

### ** Examples


############### Heteroscadestic error
N <- 1000
set.seed(123); X <- c(rnorm(N/2, mean=-2), rnorm(N/2,mean=2)); U <- rnorm(N,sd=1); msigma <- runif(N,min=0.3,max=0.5)
W <- X + msigma*U

plot.simex.density <- function(X.simex,X,...){
	plot(X.simex$x, X.simex$y, type="l", xlab="x", ylab="density", lwd=3, lty=2, col=2,...)
	lines(density(X, bw="SJ"), lwd=3)
	}

par(mfrow=c(2,2))
X.simex1 <- simex.H.density(W, msigma=msigma, adjust=1, n.lambda=50, span=1)
plot.simex.density(X.simex1, X, ylim=c(0,0.25))

X.simex2 <- simex.H.density(W, msigma=msigma, adjust=1, n.lambda=50, span=3)
plot.simex.density(X.simex2, X, ylim=c(0,0.25))

X.simex3 <- simex.H.density(W, msigma=msigma, adjust=1, n.lambda=50, span=8)
plot.simex.density(X.simex3, X, ylim=c(0,0.25))

X.simex4 <- simex.H.density(W, msigma=msigma, adjust=1, n.lambda=50, span=35)
plot.simex.density(X.simex4, X, ylim=c(0,0.25))




