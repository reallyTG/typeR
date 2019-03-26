library(bayesm)


### Name: rbayesBLP
### Title: Bayesian Analysis of Random Coefficient Logit Models Using
###   Aggregate Data
### Aliases: rbayesBLP
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {

## Simulate aggregate level data
simulData <- function(para, others, Hbatch) {
  # Hbatch does the integration for computing market shares
  #      in batches of size Hbatch

  ## parameters
  theta_bar <- para$theta_bar
  Sigma <- para$Sigma
  tau_sq <- para$tau_sq

  T <- others$T	
  J <- others$J	
  p <- others$p	
  H <- others$H	
  K <- J + p	

  ## build X	
  X <- matrix(runif(T*J*p), T*J, p)
  inter <- NULL
  for (t in 1:T) { inter <- rbind(inter, diag(J)) }
  X <- cbind(inter, X)

  ## draw eta ~ N(0, tau_sq)	
  eta <- rnorm(T*J)*sqrt(tau_sq)
  X <- cbind(X, eta)

  share <- rep(0, J*T)
  for (HH in 1:(H/Hbatch)){
    ## draw theta ~ N(theta_bar, Sigma)
    cho <- chol(Sigma)
    theta <- matrix(rnorm(K*Hbatch), nrow=K, ncol=Hbatch)
    theta <- t(cho)%*%theta + theta_bar

    ## utility
    V <- X%*%rbind(theta, 1)
    expV <- exp(V)
    expSum <- matrix(colSums(matrix(expV, J, T*Hbatch)), T, Hbatch)
    expSum <- expSum %x% matrix(1, J, 1)
    choiceProb <- expV / (1 + expSum)
    share <- share +  rowSums(choiceProb) / H
  }

  ## the last K+1'th column is eta, which is unobservable.
  X <- X[,c(1:K)]	
  return (list(X=X, share=share))
}

## true parameter
theta_bar_true <- c(-2, -3, -4, -5)
Sigma_true <- rbind(c(3,2,1.5,1), c(2,4,-1,1.5), c(1.5,-1,4,-0.5), c(1,1.5,-0.5,3))
cho <- chol(Sigma_true)
r_true <- c(log(diag(cho)), cho[1,2:4], cho[2,3:4], cho[3,4]) 
tau_sq_true <- 1

## simulate data
set.seed(66)
T <- 300
J <- 3
p <- 1
K <- 4
H <- 1000000
Hbatch <- 5000

dat <- simulData(para=list(theta_bar=theta_bar_true, Sigma=Sigma_true, tau_sq=tau_sq_true),
                 others=list(T=T, J=J, p=p, H=H), Hbatch)
X <- dat$X
share <- dat$share

## Mcmc run
R <- 2000
H <- 50
Data1 <- list(X=X, share=share, J=J)
Mcmc1 <- list(R=R, H=H, nprint=0)
set.seed(66)
out <- rbayesBLP(Data=Data1, Mcmc=Mcmc1)

## acceptance rate
out$acceptrate

## summary of draws
summary(out$thetabardraw)
summary(out$Sigmadraw)
summary(out$tausqdraw)

### plotting draws
plot(out$thetabardraw)
plot(out$Sigmadraw)
plot(out$tausqdraw)
}



