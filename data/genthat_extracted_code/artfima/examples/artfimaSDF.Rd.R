library(artfima)


### Name: artfimaSDF
### Title: Computation of theoretical spectral density function (SDF)
### Aliases: artfimaSDF
### Keywords: ts

### ** Examples

phi <- 0.8
n <- 256
set.seed(4337751)
z <- artsim(n, phi=phi)
VarZ <- mean((z-mean(z))^2)
Ip <- Periodogram(z)
length(Ip)
x <- (1/n)*(1:length(Ip))
plot(x, Ip, xlab="frequency", ylab="Spectral density & Periodogram", 
     main=paste("AR(1), phi =", phi), type="l", col=rgb(0,0,1,0.5))
n <- 5000
y <- artfimaSDF(n, phi=phi)
x <- (1/n)*(1:length(y))
lines(x, y, type="l", lwd=1.25)
h <- x[2]-x[1] #step length
SimpsonsRule <- function(h, y) {
  n <- length(y)
  h/3*sum(y * c(1, rep(c(4,2), n-1), 1))
}
AreaApprox <- SimpsonsRule(h, y)
text(0.2, 50, labels=paste("Area under SDF using Simpson's Rule =", 
                           round(AreaApprox,4)))
TVarZ <- 1/(1-phi^2)
text(0.2, 40, labels=paste("Theoretical AR Variance =", round(TVarZ,4)))
text(0.2, 30, labels=paste("mean(Ip) =", round(mean(Ip),4)))
text(0.2, 20, labels=paste("sample variance =", round(VarZ,4)))



