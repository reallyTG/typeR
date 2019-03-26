library(mixedsde)


### Name: mixedsde.fit
### Title: Estimation Of The Random Effects In Mixed Stochastic
###   Differential Equations
### Aliases: mixedsde.fit
### Keywords: estimation

### ** Examples

# Frequentist estimation
# Two random effects
model = 'CIR'; T <- 10
delta <- 0.1; M <- 100 # delta <- 0.001 and M <- 200 would yield good results
N <- floor(T/delta); sigma <- 0.01 ;
random <- c(1,2); density.phi <- 'gammainvgamma2'; param<- c(1.8, 0.8, 8, 0.05);  
simu <- mixedsde.sim(M=M, T=T, N=N, model=model,random=random, density.phi=density.phi, 
               param=param, sigma=sigma, invariant = 1)
X <- simu$X ; phi <- simu$phi; times <- simu$times
estim.method<- 'nonparam'
estim <- mixedsde.fit(times=times, X=X, model=model, random=random, estim.method= 'nonparam') 
#To stock the results of the function, use method \code{out}
#which put the outputs of the function on a list according to the frequentist or 
# Bayesian approach.
outputsNP <- out(estim)

## Not run: 
##D plot(estim)
## End(Not run)
# It represents the bidimensional density, the histogram of the first estimated random 
# effect \eqn{\alpha} with the  marginal of \eqn{\hat{f}} from the first coordonate which 
# estimates  the density of \eqn{\alpha}. And the same for the second random effect 
# \eqn{\beta}. More, it plots a qq-plot for the sample of estimator of the random effects 
# compared with the quantiles of a Gaussian sample with the same mean and standard deviation.

summary(estim)
print(estim)
# Validation 

validation <- valid(estim)

# Parametric estimation
estim.method<-'paramML'
estim_param <- mixedsde.fit(times= times, X= X, model= model, random= random, 
           estim.method = 'paramML') 
outputsP <- out(estim_param)

#plot(estim_param)
summary(estim_param)

# Not run
## Not run: 
##D test1 <- pred(estim,  invariant  = 1)
##D test2 <- pred(estim_param, invariant  = 1)
## End(Not run)
# More graph
fhat <- outputsNP$estimf  
fhat_trunc <- outputsNP$estimf.trunc 
fhat_param <- outputsP$estimf

gridf <- outputsNP$gridf; gridf1 <- gridf[1,]; gridf2 <- gridf[2,]

marg1 <- ((max(gridf2)-min(gridf2))/length(gridf2))*apply(fhat,1,sum) 
marg1_trunc <- ((max(gridf2)-min(gridf2))/length(gridf2))*apply(fhat_trunc,1,sum) 
marg2 <- ((max(gridf1)-min(gridf1))/length(gridf1))*apply(fhat,2,sum)
marg2_trunc <- ((max(gridf1)-min(gridf1))/length(gridf1))*apply(fhat_trunc,2,sum)

marg1_param <- ((max(gridf2)-min(gridf2))/length(gridf2))*apply(fhat_param,1,sum) 
marg2_param <- ((max(gridf1)-min(gridf1))/length(gridf1))*apply(fhat_param,2,sum)
f1 <-  (gridf1^(param[1]-1))*exp(-gridf1/param[2])/((param[2])^param[1]*gamma(param[1]))
f2 <-  (gridf2^(-param[3]-1)) * exp(-(1/param[4])*(1/gridf2)) * 
 ((1/param[4])^param[3])*(1/gamma(param[3]))
par(mfrow=c(1,2))
plot(gridf1,f1,type='l', lwd=1,  xlab='', ylab='')
lines(gridf1,marg1_trunc,col='blue', lwd=2)
lines(gridf1,marg1,col='blue', lwd=2, lty=2)
lines(gridf1,marg1_param,col='red', lwd=2, lty=2)
plot(gridf2,f2,type='l', lwd=1, xlab='', ylab='')
lines(gridf2,marg2_trunc,col='blue', lwd=2)
lines(gridf2,marg2,col='blue', lwd=2, lty=2)
lines(gridf2,marg2_param,col='red', lwd=2, lty=2)

cutoff <- outputsNP$cutoff
phihat <- outputsNP$estimphi 
phihat_trunc <- outputsNP$estimphi.trunc
par(mfrow=c(1,2))
plot.ts(phi[1,], phihat[1,], xlim=c(0, 15), ylim=c(0,15), pch=18); abline(0,1)
points(phi[1,]*(1-cutoff), phihat[1,]*(1-cutoff), xlim=c(0, 20), ylim=c(0,20),pch=18, col='red'); 
abline(0,1)
plot.ts(phi[2,], phihat[2,], xlim=c(0, 15), ylim=c(0,15),pch=18); abline(0,1)
points(phi[2,]*(1-cutoff), phihat[2,]*(1-cutoff), xlim=c(0, 20), ylim=c(0,20),pch=18, col='red'); 
abline(0,1)

# one random effect: 
## Not run: 
##D model <-'OU'
##D random <- 1
##D M <- 80; T <- 100  ; N <- 2000 
##D sigma <- 0.1 ; X0 <- 0
##D density.phi <- 'normal'
##D fixed <- 2 ; param <- c(1, 0.2)
##D #-------------------
##D #- simulation
##D simu <- mixedsde.sim(M,T=T,N=N,model=model,random=random, fixed=fixed,density.phi=density.phi, 
##D                param=param, sigma=sigma, X0=X0)
##D X <- simu$X
##D phi <- simu$phi
##D times <-simu$times
##D plot(times, X[10,], type='l')
##D 
##D #- parametric estimation
##D estim.method<-'paramML'
##D estim_param <- mixedsde.fit(times, X=X, model=model, random=random, estim.fix= 1, 
##D                estim.method=estim.method)
##D outputsP <- out(estim_param)
##D estim.fixed <- outputsP$estim.fixed #to compare with fixed
##D #or 
##D estim_param2 <- mixedsde.fit(times, X=X, model=model, random=random, fixed = fixed, 
##D              estim.method=estim.method)
##D outputsP2 <- out(estim_param2)
##D #- nonparametric estimation
##D estim.method <- 'nonparam'
##D estim <- mixedsde.fit(times, X, model=model, random=random, fixed = fixed, 
##D            estim.method=estim.method) 
##D outputsNP <- out(estim)
##D 
##D plot(estim)
##D print(estim)
##D summary(estim)
##D 
##D plot(estim_param)
##D print(estim_param)
##D summary(estim_param)
##D 
##D valid1 <- valid(estim)
##D test1 <- pred(estim )
##D test2 <- pred(estim_param)
## End(Not run)

# Parametric Bayesian estimation 
# one random effect
random <- 1; sigma <- 0.1; fixed <- 5; param <- c(3, 0.5)
sim <- mixedsde.sim(M = 20, T = 1, N = 50, model = 'OU', random = random, fixed = fixed,
       density.phi = 'normal',param= param, sigma= sigma, X0 = 0, op.plot = 1)

# here: only 100 iterations for example - should be much more!
prior <- list( m = c(param[1], fixed), v = c(param[1], fixed), alpha.omega = 11,
            beta.omega = param[2]^2*10, alpha.sigma = 10, beta.sigma = sigma^2*9)
estim_Bayes <- mixedsde.fit(times = sim$times, X = sim$X, model = 'OU', random, 
           estim.method = 'paramBayes', prior = prior, nMCMC = 100) 

validation <- valid(estim_Bayes, numj = 10)
plot(estim_Bayes)
outputBayes <- out(estim_Bayes)
summary(outputBayes)
(results_Bayes <- summary(estim_Bayes))
plot(estim_Bayes, style = 'cred.int', true.phi = sim$phi)
print(estim_Bayes)
## Not run: 
##D pred.result <- pred(estim_Bayes)
##D summary(out(pred.result))
##D plot(pred.result)
##D 
##D pred.result.trajectories <- pred(estim_Bayes, trajectories = TRUE)
## End(Not run)
# second example
## Not run: 
##D random <- 2; sigma <- 0.2; fixed <- 5; param <- c(3, 0.5)
##D sim <- mixedsde.sim(M = 20, T = 1, N = 100, model = 'CIR', random = random, 
##D         fixed = fixed, density.phi = 'normal',param = param, sigma = sigma, X0 = 0.1, op.plot = 1)
##D 
##D prior <- list(m = c(fixed, param[1]), v = c(fixed, param[1]), alpha.omega = 11, 
##D          beta.omega = param[2]^2*10, alpha.sigma = 10, beta.sigma = sigma^2*9)
##D 
##D estim_Bayes <- mixedsde.fit(times = sim$times, X = sim$X, model = 'CIR', random = random, 
##D                  estim.method = 'paramBayes', prior = prior, nMCMC = 1000) 
##D 
##D pred.result <- pred(estim_Bayes)
## End(Not run)



# invariant case
## Not run: 
##D random <- 1; sigma <- 0.1; fixed <- 5; param <- c(3, 0.5)
##D sim <- mixedsde.sim(M = 50, T = 5, N = 100, model = 'OU', random = random, fixed = fixed, 
##D            density.phi = 'normal',param = param, sigma = sigma, invariant = 1, op.plot = 1)
##D 
##D prior <- list(m = c(param[1], fixed), v = c(param[1], 1e-05), alpha.omega = 11, 
##D        beta.omega = param[2]^2*10, alpha.sigma = 10, beta.sigma = sigma^2*9)
##D estim_Bayes <- mixedsde.fit(times = sim$times, X = sim$X, model = 'OU', random, 
##D        estim.method = 'paramBayes', prior = prior, nMCMC = 100) 
##D plot(estim_Bayes)
##D 
##D pred.result <- pred(estim_Bayes, invariant = 1)
##D pred.result.traj <- pred(estim_Bayes, invariant = 1, trajectories = TRUE)
## End(Not run)




