library(rarhsmm)


### Name: em.hmm
### Title: EM algorithm to compute maximum likelihood estimate of Gaussian
###   hidden Markov models with / without autoregressive structures and
###   with / without regularization on the covariance matrices and/or
###   autoregressive structures.
### Aliases: em.hmm

### ** Examples

set.seed(332213)
data(finance)
x <- data.matrix(finance)
#log return
y <- x[-1,-51]
for(i in 2:nrow(x)){
 y[i-1,] <- log(x[i,-51]) - log(x[i-1,-51])
}
#annualize the log return
y <- y * 252 

#first, fit a Gaussian HMM without autoregressive structure
m <- 2
#initialize the list of means
mu <- list(apply(y,2,mean), apply(y,2,mean))
#initialize the list of covariance matrices
sigma <- list(cov(y)*1.2,cov(y)*0.8)
#initialize the prior probability
delta <- c(0.5,0.5)
#initialize the transition probabilities
gamma <- matrix(c(0.9,0.1,0.2,0.8),2,2,byrow=TRUE)
mod1 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma)
#will not run without a shrinkage on the covariance matrices because the 
#series is not long enough to reliably estimate the covariance structure
fit1 <- em.hmm(y=y,mod=mod1,cov.shrink=0.0001)
st1 <- viterbi.hmm(y=y,mod=fit1)
sp1 <- smooth.hmm(y=y,mod=fit1)

## Not run: 
##D #second, fit a Gaussian HMM with 1st order autoregressive structure
##D auto <- list(matrix(rep(0,2500),50,50,byrow=TRUE),
##D              matrix(rep(0,2500),50,50,byrow=TRUE))
##D mod2 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,auto=auto)
##D fit2 <- em.hmm(y=y,mod=mod2,ntimes=NULL,cov.shrink=0.0001,arp=1,
##D                auto.alpha=1,auto.lambda=0.1)
##D st2 <- viterbi.hmm(y=y,mod=fit2)
##D sp2 <- smooth.hmm(y=y,mod=fit2)
##D 
##D #third, fit a Gaussian HMM with 2nd order autoregressive structure
##D auto <- list(matrix(rep(0,5000),50,100,byrow=TRUE),
##D              matrix(rep(0,5000),50,100,byrow=TRUE))
##D mod3 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,auto=auto)
##D fit3 <- em.hmm(y=y,mod=mod3,ntimes=NULL,cov.shrink=0.0001,arp=2,
##D                auto.alpha=1,auto.lambda=0.1)
##D st3 <- viterbi.hmm(y=y,mod=fit3)
##D sp3 <- smooth.hmm(y=y,mod=fit3)
## End(Not run)



