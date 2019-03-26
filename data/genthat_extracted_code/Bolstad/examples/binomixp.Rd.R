library(Bolstad)


### Name: binomixp
### Title: Binomial sampling with a beta mixture prior
### Aliases: binomixp
### Keywords: misc

### ** Examples


## simplest call with 6 successes observed in 8 trials and a 50:50 mix
## of two beta(1,1) uniform priors
binomixp(6,8)

## 6 successes observed in 8 trials and a 20:80 mix of a non-uniform
## beta(0.5,6) prior and a uniform beta(1,1) prior
binomixp(6,8,alpha0=c(0.5,6),alpha1=c(1,1),p=0.2)

## 4 successes observed in 12 trials with a 90:10 non uniform beta(3,3) prior
## and a non uniform beta(4,12).
## Plot the stored prior, likelihood and posterior
results = binomixp(4, 12, c(3, 3), c(4, 12), 0.9)$mix

par(mfrow = c(3,1))
y.lims = c(0, 1.1 * max(results$posterior, results$prior))

plot(results$pi,results$prior,ylim=y.lims,type='l'
,xlab=expression(pi),ylab='Density',main='Prior')
polygon(results$pi,results$prior,col='red')

plot(results$pi,results$likelihood,type='l',
     xlab = expression(pi), ylab = 'Density', main = 'Likelihood')
polygon(results$pi,results$likelihood,col='green')

plot(results$pi,results$posterior,ylim=y.lims,type='l'
,xlab=expression(pi),ylab='Density',main='Posterior')
polygon(results$pi,results$posterior,col='blue')







