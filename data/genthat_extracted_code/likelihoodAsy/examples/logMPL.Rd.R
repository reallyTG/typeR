library(likelihoodAsy)


### Name: logMPL
### Title: Modified profile likelihood computation
### Aliases: logMPL
### Keywords: htest

### ** Examples

# Approximating the conditional likelihood for logistic regression
# Let us define the various functions	
# Log likelihood for logistic regression
loglik.logit<- function(theta, data) 
{
  y <- data$y
  den <- data$den
  X <- data$X
  eta <- X %*% theta
  p <- plogis(eta)
  l <- sum(y * log(p) + (den - y) * log(1-p))
  return(l)
}
# Score function
grad.logit<- function(theta, data) 
{
  y <- data$y
  den <- data$den
  X <- data$X
  eta <- X %*% theta
  p <- plogis(eta)
  out <- t(y - p * den) %*% X
  return(drop(out))
}
# Data generator
gendat.logit<- function(theta, data)
{
  X <- data$X
  eta <- X %*% theta
  p <- plogis(eta)
  out <- data
  out$y <- rbinom(length(data$y), size = data$den, prob = p)
  return(out) 
}		
# Famous crying babies data
data(babies)	
mod.glm <- glm(formula = cbind(r1, r2) ~ day + lull - 1, family = binomial, 
               data = babies)
data.obj <- list(y = babies$r1, den = babies$r1 + babies$r2, 
                 X = model.matrix(mod.glm))	
# Numerical optimization of profile and modified profile log likelihoods
max.prof <- nlminb(0, logPL, data=data.obj, thetainit=coef(mod.glm), 
                  floglik=loglik.logit, fscore=grad.logit, indpsi=19, minus=TRUE, trace=FALSE)
max.mpl <- nlminb(0, logMPL, data=data.obj, mle=coef(mod.glm), 
                  floglik=loglik.logit, fscore=grad.logit, datagen=gendat.logit,
                  indpsi=19, R=50, seed=2020, minus=TRUE, trace=FALSE)
c(max.prof$par, max.mpl$par)                 
# We can plot the profile likelihood and the modified profile likelihood
# R=50 suffices for the modified profile likelihood as the model is a full exp. family
psi.vals <- seq(-0.3, 3.7, l=20)
obj.prof <- sapply(psi.vals, logPL, data=data.obj, thetainit=coef(mod.glm), 
                floglik=loglik.logit, fscore=grad.logit, indpsi=19, trace=FALSE)
obj.mpl <- sapply(psi.vals, logMPL, data=data.obj, mle=coef(mod.glm), 
                floglik=loglik.logit, fscore=grad.logit, datagen=gendat.logit,
                indpsi=19, trace=FALSE, R=50, seed=2020)
par(pch="s")
plot(psi.vals, obj.prof - max(obj.prof), type="l", xlab=expression(psi), 
     ylab="log likelihood", lwd=2, las=1)
lines(psi.vals, obj.mpl - max(obj.mpl), col="red", lwd=2)
legend("topright", col=c(1, 2), lty=1, lwd=2, legend=c("Profile","MPL"), bty="n")
  



