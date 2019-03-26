library(likelihoodAsy)


### Name: logPL
### Title: Profile likelihood computation
### Aliases: logPL
### Keywords: htest

### ** Examples

# A negative binomial example, taken from Venables and Ripley (2002, MASS4 book)
library(MASS)
# The quine data are analysed in Section 7.4
data(quine)
# We fit a model with just the main effects
quine.nb1 <- glm.nb(Days ~ Eth + Sex + Age + Lrn, data = quine) 
# The data list includes the design matrix and the response vector
quinedata<-list(X=model.matrix(quine.nb1), y=quine$Days)      
# Let us define the various functions
# Log likelihood, log link
logLikNbin <- function(theta,data) 
{
  y <- data$y
  X <- data$X
  eta <- X %*% theta[1:ncol(X)] 
  mu <- exp(eta)
  alpha <- theta[ncol(X)+1]
  l <- sum(lgamma(y + alpha) + y * log(mu) - (alpha + y) * log(alpha + mu) 
            - lgamma(alpha) + alpha * log(alpha))
  return(l)
}


# Score function
gradLikNbin <- function(theta,data) 
{
  y <- data$y
  X <- data$X
  eta <- X %*% theta[1:ncol(X)] 
  mu <- exp(eta)
  alpha <- theta[ncol(X)+1]
  g <-rep(0,ncol(X)+1)
  g[1:ncol(X)] <- t(y - (alpha+y)*mu / (alpha+mu)) %*% X
  g[ncol(X)+1] <- sum(digamma( y + alpha) - log(alpha + mu) - (alpha + y) / (alpha + mu) 
                  - digamma(alpha) + 1 + log(alpha))
  return(g)
}
# Data generator
genDataNbin<- function(theta,data)
{
  out <- data
  X <- data$X
  eta<- X %*% theta[1:ncol(X)] 
  mu <- exp(eta)
  out$y <- rnegbin(length(data$y), mu=mu, theta=theta[ncol(X)+1])
  return(out)
}		
# First we refine the maximum likelihood estimates
mleFull <- optim( c(coef(quine.nb1),quine.nb1$theta), logLikNbin, gr=gradLikNbin,
           method="BFGS", data=quinedata, control=list(fnscale=-1), hessian=TRUE) 
 # Then we can plot the profile likelihood
list.psi <- seq(0.90, 1.70, l=30)
list.prof <- sapply(list.psi, logPL, data=quinedata, thetainit=mleFull$par, floglik=logLikNbin, 
                    fscore=gradLikNbin, indpsi=8, trace=FALSE) 
plot(list.psi, list.prof-max(list.prof), type="l", xlab=expression(psi), ylab="Log likelihood")



