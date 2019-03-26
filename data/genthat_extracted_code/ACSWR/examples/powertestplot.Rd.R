library(ACSWR)


### Name: powertestplot
### Title: A Function to Plot the Power of a UMP Test for Normal
###   Distribution
### Aliases: powertestplot
### Keywords: power plot

### ** Examples

UMPNormal <- function(mu0, sigma, n,alpha)  {
  qnorm(alpha)*sigma/sqrt(n)+mu0
}
UMPNormal(mu0=0, sigma=1,n=1,alpha=0.5)
powertestplot <- function(mu0,sigma,n,alpha)	{
  mu0seq <- seq(mu0-3*sigma, mu0+3*sigma,(6*sigma/100))
  betamu <- pnorm(sqrt(n)*(mu0seq-mu0)/sigma-qnorm(1-alpha))
  plot(mu0seq,betamu,"l",xlab=expression(mu),ylab="Power of UMP Test",
    main = expression(paste("H:",mu <= mu[0]," vs K:",mu>mu[0])))
  abline(h=alpha)
  abline(v=mu0)
}
powertestplot(mu0=0,sigma=1,n=10,alpha=0.05)
# H:mu > mu_0 vs K: mu <= mu_0
UMPNormal <- function(mu0, sigma, n,alpha)	{
  mu0-qnorm(alpha)*sigma/sqrt(n)
}
UMPNormal(mu0=0, sigma=1,n=1,alpha=0.5)
powertestplot <- function(mu0,sigma,n,alpha)	{
  mu0seq <- seq(mu0-3*sigma, mu0+3*sigma,(6*sigma/100))
  betamu <- pnorm(sqrt(n)*(mu0-mu0seq)/sigma-qnorm(1-alpha))
  plot(mu0seq,betamu,"l",xlab=expression(mu),ylab="Power of UMP Test",
    main=expression(paste("H:",mu >= mu[0]," vs K:",mu<mu[0])))
  abline(h=alpha)
  abline(v=mu0)
}
powertestplot(mu0=0,sigma=1,n=10,alpha=0.05)



