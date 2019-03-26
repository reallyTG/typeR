library(ltbayes)


### Name: fmodel3pp
### Title: Latent Trait Posterior of the Three-Parameter Binary Probit
###   Model
### Aliases: fmodel3pp

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

alph <- rep(1, 5)   # discrimination parameters
beta <- -2:2        # difficulty parameters
gamm <- rep(0.1, 5) # lower asymptote parameters

post <- postsamp(fmodel3pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm,
	control = list(nbatch = samp + burn))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodel3pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodel3pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodel3pp, c(1,1,0,0,0), 
	apar = alph, bpar = beta, cpar = gamm) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodel3pp, c(1,1,0,0,0), apar = alph, 
	bpar = beta, cpar = gamm) # profile likelihood confidence interval



