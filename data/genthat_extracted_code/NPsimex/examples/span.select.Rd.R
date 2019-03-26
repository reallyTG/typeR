library(NPsimex)


### Name: span.select
### Title: A method to select the span of the sequence of lambda's for the
###   case of homoscedastic error
### Aliases: span.select
### Keywords: smooth

### ** Examples


############### Homoscadestic error
N <- 1000
set.seed(123); X <- c(rnorm(N/2, mean=-2), rnorm(N/2,mean=2)); U <- rnorm(N,sd=1)
msigma <- 0.5
W <- X + msigma*U

plot.simex.density <- function(X.simex,X,...){
	plot(X.simex$x, X.simex$y, type="l", xlab="x", ylab="density", lwd=3, lty=2, col=2,...)
	lines(density(X, bw="SJ"), lwd=3)
	}

#---- Select the optimal lambda span
par(mfrow=c(1,2))
spans <- span.select(W, msigma)
plot(spans$span, spans$ISE, type="o", xlab="span", ylab="ISE") 

X.simex <- simex.density(W, msigma=msigma, adjust=1, n.lambda=50, span=spans$span[order(spans$ISE)[1]])
plot.simex.density(X.simex, X, ylim=c(0,0.25))




