library(likelihoodAsy)


### Name: rstar.ci
### Title: Confidence intervals on a scalar function of interest by the r*
###   statistic
### Aliases: rstar.ci
### Keywords: htest

### ** Examples

# A negative binomial example, taken from Venables and Ripley (2002, MASS4 book)
library(MASS)
# The quine data are analysed in Section 7.4
data(quine)
# We fit a model with just the main effects
quine.nb1 <- glm.nb(Days ~ Eth + Sex + Age + Lrn, data = quine) 
# The data list includes the design matrix and the response vector
quinedata <- list(X=model.matrix(quine.nb1), y=quine$Days)      
# Let us define the required functions
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
genDataNbin <- function(theta,data)
{
  out <- data
  X <- data$X
  eta<- X %*% theta[1:ncol(X)] 
  mu <- exp(eta)
  out$y <- rnegbin(length(data$y), mu=mu, theta=theta[ncol(X)+1])
  return(out)
}	
# Confidence intervals for the coefficient of EthN 
## Not run: 
##D obj <- rstar.ci(quinedata, thetainit=c(coef(quine.nb1),quine.nb1$theta),  floglik=logLikNbin, 
##D                 datagen=genDataNbin, fscore=gradLikNbin, fpsi=function(theta) theta[2], R=1000, 
##D                 psidesc="Coefficient of EthN")
##D print(obj)
##D summary(obj)
##D plot(obj)
##D # Confidence intervals for the overdispersion parameter
##D obj <- rstar.ci(quinedata, thetainit=c(coef(quine.nb1),quine.nb1$theta),  floglik=logLikNbin, 
##D                 datagen=genDataNbin, fscore=gradLikNbin, fpsi=function(theta) theta[8], R=1000,
##D                 psidesc="Overdispersion parameter")
##D summary(obj)
##D plot(obj)
## End(Not run)



