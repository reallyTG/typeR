library(rarhsmm)


### Name: em.semi
### Title: EM algorithm to compute maximum likelihood estimate of Gaussian
###   hidden semi-Markov models with / without autoregressive structures
###   and with / without regularization on the covariance matrices and/or
###   autoregressive structures.
### Aliases: em.semi

### ** Examples

## Not run: 
##D set.seed(332213)
##D data(finance)
##D x <- data.matrix(finance)
##D #log return
##D y <- x[-1,-51]
##D for(i in 2:nrow(x)){
##D  y[i-1,] <- log(x[i,-51]) - log(x[i-1,-51])
##D }
##D #annualize the log return
##D y <- y * 252 
##D 
##D #first, fit a Gaussian HMM without autoregressive structure
##D m <- 2
##D #initialize the list of means
##D mu <- list(apply(y,2,mean), apply(y,2,mean))
##D #initialize the list of covariance matrices
##D sigma <- list(cov(y)*1.2,cov(y)*0.8)
##D #initialize the prior probability
##D delta <- c(0.5,0.5)
##D #initialize the transition probabilities
##D gamma <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
##D #initialize the state duration probabilities
##D d <- list(rep(0.1,10),rep(0.1,10))
##D mod1 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,d=d)
##D #will not run without a shrinkage on the covariance matrices because the 
##D #series is not long enough to reliably estimate the covariance structure
##D fit1 <- em.semi(y=y,mod=mod1,cov.shrink=0.0001)
##D st1 <- viterbi.semi(y=y,mod=fit1)
##D sp1 <- smooth.semi(y=y,mod=fit1)
##D 
##D #second, fit a Gaussian HSMM with 1st order autoregressive structure
##D auto <- list(matrix(rep(0,2500),50,50,byrow=TRUE),
##D              matrix(rep(0,2500),50,50,byrow=TRUE))
##D mod2 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,auto=auto,
##D              d=d,arp=1)
##D #increase auto.lambda to enforce stronger regularization for model to run
##D fit2 <- em.semi(y=y,mod=mod2,cov.shrink=0.001,arp=1,
##D                auto.alpha=0.8,auto.lambda=10)
##D sum(fit2$auto[[1]]==0)
##D sum(fit2$auto[[2]]==0)
##D st2 <- viterbi.semi(y=y,mod=fit2)
##D sp2 <- smooth.semi(y=y,mod=fit2)
##D 
##D #third, fit a Gaussian HSMM with 2nd order autoregressive structure
##D auto <- list(matrix(rep(0,5000),50,100,byrow=TRUE),
##D              matrix(rep(0,5000),50,100,byrow=TRUE))
##D mod3 <- list(m=m,mu=mu,sigma=sigma,delta=delta,gamma=gamma,auto=auto,
##D              d=d,arp=2)
##D #increase auto.lambda to enforce stronger regularization for model to run
##D fit3 <- em.semi(y=y,mod=mod3,ntimes=NULL,cov.shrink=0.0001,arp=2,
##D                auto.alpha=0.8,auto.lambda=30)
##D sum(fit3$auto[[1]]==0)
##D sum(fit3$auto[[2]]==0)
##D st3 <- viterbi.semi(y=y,mod=fit3)
##D sp3 <- smooth.semi(y=y,mod=fit3)
## End(Not run)



