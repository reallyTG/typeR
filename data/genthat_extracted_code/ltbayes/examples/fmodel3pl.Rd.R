library(ltbayes)


### Name: fmodel3pl
### Title: Latent Trait Posterior of the Three-Parameter Binary Logistic
###   Model
### Aliases: fmodel3pl

### ** Examples

samp <- 5000 # samples from posterior distribution
burn <- 1000 # burn-in samples to discard

alph <- c(1.27,1.34,1.14,1,0.67)   # discrimination parameters
beta <- c(1.19,0.59,0.15,-0.59,-2) # difficulty parameters
gamm <- c(0.1,0.15,0.15,0.2,0.01)  # lower asymptote parameters

post <- postsamp(fmodel3pl, c(0,0,1,1,1), 
	apar = alph, bpar = beta, cpar = gamm,
	control = list(nbatch = samp + burn, scale = 3))

post <- data.frame(sample = 1:samp, 
	zeta = post$batch[(burn + 1):(samp + burn)])
	
with(post, plot(sample, zeta), type = "l")  # trace plot of sampled realizations
with(post, plot(density(zeta, adjust = 2))) # density estimate of posterior distribution

with(posttrace(fmodel3pl, c(0,0,1,1,1), apar = alph, bpar = beta, cpar = gamm),
	plot(zeta, post, type = "l")) # profile of log-posterior density

information(fmodel3pl, c(0,0,1,1,1), apar = alph, bpar = beta, cpar = gamm) # Fisher information

with(post, mean(zeta)) # posterior mean
postmode(fmodel3pl, c(0,0,1,1,1), apar = alph, bpar = beta, cpar = gamm) # posterior mode

with(post, quantile(zeta, probs = c(0.025, 0.975))) # posterior credibility interval
profileci(fmodel3pl, c(0,0,1,1,1), apar = alph, 
	bpar = beta, cpar = gamm) # profile likelihood confidence interval



