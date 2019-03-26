library(TestCor)


### Name: TestCor-package
### Title: FWER and FDR controlling procedures for multiple correlation
###   tests
### Aliases: TestCor-package TestCor
### Keywords: multiple testing, FWER, FDR, correlation test, graph
###   inference

### ** Examples

## No test: 
# Parameters for simulations
Nsimu  <- 100                # number of Monte-Carlo simulations
seqn   <- seq(100,400,100)   # sample sizes
p      <- 10                 # number of random variables considered
rho    <- 0.3                # value of non-zero correlations
seed   <- 156724
 
corr_theo <- diag(1,p)       # the correlation matrix
corr_theo[1,2:p] <- rho
corr_theo[2:p,1] <- rho               

# Parameters for multiple testing procedure
stat_test <- 'empirical'     # test statistics for correlation tests
method <- 'BootRW'           # FWER controlling procedure
SD <- FALSE                  # logical determining if stepdown is applied
alpha  <- 0.05               # FWER threshold 
Nboot  <- 100                # number of bootstrap or simulated samples

# Simulations and application of the chosen procedure
res <- matrix(0,nrow=length(seqn),ncol=4)
for(i in 1:length(seqn)){
    temp <- SimuFwer(corr_theo,n=seqn[i],Nsimu=Nsimu,alpha=alpha,stat_test=stat_test,
           method='BootRW',Nboot=Nboot,stepdown=SD,seed=seed)
    res[i,] <- temp
}
rownames(res) <- seqn
colnames(res) <- names(temp)

# Display results
par(mfrow=c(1,2))
plot(seqn,res[,'fwer'],type='b',ylim=c(0,max(alpha*1.1,max(res[,'fwer']))),
    main='FWER',ylab='fwer',xlab='number of observations')
plot(seqn,res[,'power'],type='b',ylim=c(0,1.1),
    main='Power',ylab='power',xlab='number of observations')
## End(No test)



