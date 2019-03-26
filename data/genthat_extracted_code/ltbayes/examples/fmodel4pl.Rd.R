library(ltbayes)


### Name: fmodel4pl
### Title: Latent Trait Posterior of the Four-Parameter Binary Logistic
###   Model
### Aliases: fmodel4pl

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

alph <- rep(1, 5)   # discrimination parameters
beta <- -2:2        # difficulty parameters
gamm <- rep(0.1, 5) # lower asymptote parameters
delt <- rep(0.9, 5)	# upper asymptote parameters

post <- postsamp(fmodel4pl, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm, dpar = delt,
	control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodel4pl, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm, dpar = delt),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodel4pl, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm, dpar = delt) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodel4pl, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm, dpar = delt) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodel4pl, c(1,1,0,0,0), apar = alph, 
	bpar = beta, cpar = gamm, dpar = delt) # profile likelihood confidence interval



